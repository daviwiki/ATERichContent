//
//  ATERichContentConstants.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, ATERichContentComponentType) {
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
extern NSString *kATERichContentComponentTypeLabel;
extern NSString *kATERichContentComponentTypeAttributtedLabel;
extern NSString *kATERichContentComponentTypeImage;
extern NSString *kATERichContentComponentTypePhotoGallery;
extern NSString *kATERichContentComponentTypeWebview;
extern NSString *kATERichContentComponentTypeMap;

@interface ATERichContentConstants : NSObject
@end
