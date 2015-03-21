//
//  ATEImageView.m
//  ATERichContent
//
//  Created by David Martinez on 21/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATEImageView.h"

static NSOperationQueue *stQueue;

@interface ATEImageViewOperation : NSOperation

@property (nonatomic, strong) NSString *mImageUrl;
@property (nonatomic, strong) NSData *mImageData;

@end
@implementation ATEImageViewOperation

- (void) main {
    [super main];
    self.mImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.mImageUrl]];
}

- (id) initWithUrl:(NSString *) url {
    self = [super init];
    if (self) {
        self.mImageUrl = url;
    }
    return self;
}

@end

@interface ATEImageView ()

/// Datas
@property (nonatomic, weak) NSString *mImageUrl;
@property (nonatomic, strong) ATEImageViewOperation *mCurrentOperation;

@end

@implementation ATEImageView

- (void) loadContent:(NSString *) imageUrl {
    if (stQueue == nil) {
        stQueue = [[NSOperationQueue alloc] init];
    }
    
    [self.mCurrentOperation setCompletionBlock:nil];
    [self.mCurrentOperation cancel];
    
    self.image = nil;
    self.mActivityIndicator.hidden = NO;
    self.mCurrentOperation = [[ATEImageViewOperation alloc] initWithUrl:imageUrl];
    self.mCurrentOperation.queuePriority = NSOperationQueuePriorityLow;
    
    __weak __block typeof(self) weakSelf = self;
    [self.mCurrentOperation setCompletionBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.mActivityIndicator.hidden = YES;
            weakSelf.image = [UIImage imageWithData:weakSelf.mCurrentOperation.mImageData];
            weakSelf.mCurrentOperation = nil;
        });
    }];
    
    [stQueue addOperation:self.mCurrentOperation];
}

- (void) showContent:(NSString *) imageUrl {
    if (imageUrl.length == 0) {
        self.image = nil;
        return;
    }
    
    [self loadContent:imageUrl];
}

@end
