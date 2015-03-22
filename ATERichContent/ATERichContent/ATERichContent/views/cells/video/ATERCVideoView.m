//
//  ATERCVideoView.m
//  ATERichContent
//
//  Created by David Martinez on 22/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCVideoView.h"
#import "ATERCHeaders.h"
#import <MediaPlayer/MediaPlayer.h>

static NSString *kATERCVideoStartNotification = @"kATERCVideoStartNotification";

@interface ATERCVideoView ()

/// Outlets
@property (nonatomic, strong) MPMoviePlayerController *mMoviePlayer;

/// Datas
@property (nonatomic, strong) ATERCVideo *mContent;

@property (nonatomic, strong) NSMutableSet *mObservers;

@end

@implementation ATERCVideoView

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) drawContent:(ATERCVideo *) content {
    if (!self.mMoviePlayer) {
        // Cooking movieplayer
        self.mMoviePlayer = [[MPMoviePlayerController alloc] init];
        self.mMoviePlayer.movieSourceType = MPMovieSourceTypeStreaming;
        self.mMoviePlayer.controlStyle = MPMovieControlStyleEmbedded;
        self.mMoviePlayer.view.translatesAutoresizingMaskIntoConstraints = NO;
        self.mMoviePlayer.shouldAutoplay = NO;
        [self.mBackgroundView addSubview:self.mMoviePlayer.view];
        
        UIView *videoView = self.mMoviePlayer.view;
        
        NSDictionary *bindings = NSDictionaryOfVariableBindings(videoView);
        NSArray *constraints = nil;
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[videoView]-(0)-|"
                                                              options:0
                                                              metrics:nil
                                                                views:bindings];
        [self addConstraints:constraints];
        constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[videoView]-(0)-|"
                                                              options:0
                                                              metrics:nil
                                                                views:bindings];
        [self addConstraints:constraints];
        [self layoutIfNeeded];
        
        // Cooking listeners
        self.mObservers = [NSMutableSet set];
        
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        __block __weak typeof(self) weakSelf = self;
        
        id<NSObject> observer = [center addObserverForName:kATERCVideoStartNotification
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note) {
                                                    NSObject *cell = note.userInfo[@"cell"];
                                                    if (weakSelf != cell) {
                                                        [weakSelf.mMoviePlayer pause];
                                                    }
                                                }];
        [self.mObservers addObject:observer];
        
        observer = [center addObserverForName:MPMoviePlayerPlaybackStateDidChangeNotification
                                       object:nil
                                        queue:nil
                                   usingBlock:^(NSNotification *note) {
                                       NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
                                       MPMoviePlaybackState playbackStatus = weakSelf.mMoviePlayer.playbackState;
                                       switch (playbackStatus) {
                                           case MPMoviePlaybackStateStopped:
                                               break;
                                           case MPMoviePlaybackStatePlaying: {
                                               [center postNotificationName:kATERCVideoStartNotification object:nil userInfo:@{@"cell":weakSelf}];
//                                               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                                                   [weakSelf.mMoviePlayer play];
//                                               });
                                               break;
                                           }
                                           case MPMoviePlaybackStatePaused:
                                               break;
                                           case MPMoviePlaybackStateInterrupted:
                                               break;
                                           case MPMoviePlaybackStateSeekingForward:
                                               break;
                                           case MPMoviePlaybackStateSeekingBackward:
                                               break;
                                           default:
                                               break;
                                       }
                                   }];
        [self.mObservers addObject:observer];
    }
    
    [self.mMoviePlayer pause];
    [self.mMoviePlayer setContentURL:[NSURL URLWithString:content.mVideoUrl]];
    [self.mMoviePlayer prepareToPlay];
}

#pragma mark - -------------------- OVERRIDES ---------------------
+ (NSNumber *) getHeightForContent:(ATERC *)content {
    return @(ABS(content.mRichContentHeight));
}

- (BOOL) validateContent:(ATERC *)content {
    return [[content class] isSubclassOfClass:[ATERCVideo class]];
}

- (void) showContent:(ATERCVideo *)content {
    if (![self validateContent:content]) {
        [ATERCLog log:@"Invalid class type excepected for content into ATERCVideoView class"];
        return;
    }
    
    self.mContent = content;
    [self drawContent:content];
}

- (void) prepareForReuse {
    [self.mMoviePlayer pause];
}

#pragma mark - -------------------- LIFECICLE ---------------------

- (void) dealloc {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    for (id<NSObject> observer in self.mObservers) {
        [center removeObserver:observer];
    }
    [self.mObservers removeAllObjects];
}

@end
