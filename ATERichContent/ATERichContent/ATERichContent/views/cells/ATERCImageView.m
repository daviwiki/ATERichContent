//
//  ATERCImageView.m
//  ATERichContent
//
//  Created by David Martinez on 3/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCImageView.h"
#import "ATERCHeaders.h"

@interface ATERCImageView ()

/// Datas
@property (nonatomic, strong) ATERCImage *mContent;

/// Outlets
@property (nonatomic, weak) IBOutlet ATEImageView *mImageView;

@end

@implementation ATERCImageView

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) drawContent:(ATERCImage *) content {
    if (content.mImageLoadBlock != nil) {
        self.mImageView.mActivityIndicator.hidden = NO;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = content.mImageLoadBlock(content.mImageUrl);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.mImageView.mActivityIndicator.hidden = YES;
                self.mImageView.image = image;
            });
        });
    } else {
        [self.mImageView showContent:content.mImageUrl];
    }
}

#pragma mark - -------------------- OVERRIDES ---------------------
+ (NSNumber *) getHeightForContent:(ATERC *)content {
    return @(ABS(content.mRichContentHeight));
}

- (BOOL) validateContent:(ATERC *)content {
    return [[content class] isSubclassOfClass:[ATERCImage class]];
}

- (void) showContent:(ATERCImage *)content {
    if (![self validateContent:content]) {
        [ATERCLog log:@"Invalid class type excepected for content into ATERCImageView class"];
        return;
    }
    
    self.mContent = content;
    [self drawContent:content];
}

#pragma mark - -------------------- LIFECICLE ---------------------

@end
