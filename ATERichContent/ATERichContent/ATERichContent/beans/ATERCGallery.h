//
//  ATERCGallery.h
//  ATERichContent
//
//  Created by David Martinez on 5/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERC.h"

@interface ATERCGallery : ATERC

@property (nonatomic, strong) NSArray *mImagesUrl; // Array (String)
@property (copy) UIImage *(^mImageLoadBlock)(NSString *imageUrl);

@end
