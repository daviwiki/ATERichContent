//
//  ATERCGalleryImageView.m
//  ATERichContent
//
//  Created by David Martinez on 22/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCGalleryImageView.h"
#import "ATERCGalleryCollectionViewCell.h"
#import "ATERCHeaders.h"

CGFloat kATERCGalleryCollectionInset = 8.0;

@interface ATERCGalleryImageView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

/// Datas
@property (nonatomic, strong) ATERCGallery *mContent;

@end

@implementation ATERCGalleryImageView

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) mountViews {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([ATERCGalleryCollectionViewCell class]) bundle:nil];
    [self.mImagesCollectionView registerNib:nib forCellWithReuseIdentifier:kATERCTypeImage];
}

- (void) drawContent:(ATERCGallery *) content {
    // Config page control
    self.mImagesPageControl.numberOfPages = content.mImagesUrl.count;
    
    // Scroll offset zero
    self.mImagesCollectionView.contentOffset = CGPointZero;
    
    // Display images
    [self.mImagesCollectionView reloadData];
}

#pragma mark - -------------------- OVERRIDES ---------------------
+ (NSNumber *) getHeightForContent:(ATERC *)content {
    return @(ABS(content.mRichContentHeight));
}

- (BOOL) validateContent:(ATERC *)content {
    return [[content class] isSubclassOfClass:[ATERCGallery class]];
}

- (void) showContent:(ATERCGallery *)content {
    if (![self validateContent:content]) {
        [ATERCLog log:@"Invalid class type excepected for content into ATERCGalleryImageView class"];
        return;
    }

    self.mContent = content;
    [self drawContent:content];
}

#pragma mark - -------------------- DELEGATES ---------------------
#pragma mark - ---- Collection View
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mContent.mImagesUrl.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ATERCGalleryCollectionViewCell *cell = (ATERCGalleryCollectionViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:kATERCTypeImage
                                                                                                                        forIndexPath:indexPath];
    ATERCImage *content = [[ATERCImage alloc] init];
    content.mRichContentHeight = self.mContent.mRichContentHeight;
    content.mRichContentWidth = self.mContent.mRichContentWidth;
    content.mRichContentType = kATERCTypeImage;
    content.mImageUrl = self.mContent.mImagesUrl[indexPath.row];
    content.mImageLoadBlock = self.mContent.mImageLoadBlock;
    [cell showContent:content];
    return cell;
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.mContent.mRichContentWidth,
                      self.mContent.mRichContentHeight);
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x / MAX(self.mContent.mRichContentWidth, 1);
    self.mImagesPageControl.currentPage = currentPage;
}

#pragma mark - -------------------- LIFECICLE ---------------------
- (void) awakeFromNib {
    [self mountViews];
}

@end
