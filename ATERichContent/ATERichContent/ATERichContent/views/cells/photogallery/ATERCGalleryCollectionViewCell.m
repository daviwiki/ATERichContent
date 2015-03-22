//
//  ATERCGalleryCollectionViewCell.m
//  ATERichContent
//
//  Created by David Martinez on 22/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCGalleryCollectionViewCell.h"
#import "ATERCHeaders.h"

@interface ATERCGalleryCollectionViewCell ()

/// Outlets
@property (nonatomic, weak) IBOutlet ATEImageView *mImageView;

/// Datas
@property (nonatomic, strong) ATERCImage *mContent;

@end

@implementation ATERCGalleryCollectionViewCell

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
- (void) showContent:(ATERCImage *)content {
    self.mContent = content;
    [self drawContent:content];
}

@end
