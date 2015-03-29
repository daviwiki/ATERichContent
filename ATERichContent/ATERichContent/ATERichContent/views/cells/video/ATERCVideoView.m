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

@interface ATERCVideoView ()

/// Outlets
@property (nonatomic, strong) MPMoviePlayerController *mMoviePlayer;

/// Datas
@property (nonatomic, strong) ATERCVideo *mContent;

@end

@implementation ATERCVideoView

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) mountViews {
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
    }
}

- (void) drawContent:(ATERCVideo *) content {
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
- (void) awakeFromNib {
    [super awakeFromNib];
    [self mountViews];
}

@end
