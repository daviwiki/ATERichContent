//
//  ATERichContentConstants.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, ATERCComponentType) {
    ATERichContentComponentTypeClass = 0,
    ATERichContentComponentTypeNib = 0,
};

///
/// ATARichContentView Properties
///
extern CGFloat kATERichContentWrapContentHeight;

///
/// ATERichContentView Types
///
extern NSString *kATERCTypeLabel;
extern NSString *kATERCTypeAttributtedLabel;
extern NSString *kATERCTypeImage;
extern NSString *kATERCTypePhotoGallery;
extern NSString *kATERCTypeWebview;
extern NSString *kATERCTypeMap;

@interface ATERCConstants : NSObject
@end
