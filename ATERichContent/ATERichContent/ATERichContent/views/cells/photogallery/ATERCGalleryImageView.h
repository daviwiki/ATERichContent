//
//  ATERCGalleryImageView.h
//  ATERichContent
//
//  Created by David Martinez on 22/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCView.h"

@interface ATERCGalleryImageView : ATERCView

@property (nonatomic, weak) IBOutlet UICollectionView *mImagesCollectionView;
@property (nonatomic, weak) IBOutlet UIPageControl *mImagesPageControl;

@end
