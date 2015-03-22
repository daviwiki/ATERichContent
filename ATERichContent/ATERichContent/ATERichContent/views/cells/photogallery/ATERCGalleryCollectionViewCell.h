//
//  ATERCGalleryCollectionViewCell.h
//  ATERichContent
//
//  Created by David Martinez on 22/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ATERCImage;

@interface ATERCGalleryCollectionViewCell : UICollectionViewCell

- (void) showContent:(ATERCImage *)content;

@end
