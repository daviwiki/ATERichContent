//
//  ATERCConstants.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, ATERCComponentType) {
    ATERCComponentTypeClass = 0,
    ATERCComponentTypeNib = 1,
};

///
/// ATERCVView Version
///
extern NSString *kATERCVersion;

///
/// ATERCView Properties
///
extern CGFloat kATERCWrapContentHeight;

///
/// ATERCView Types
///
extern NSString *kATERCTypeLabel;
extern NSString *kATERCTypeAttributtedLabel;
extern NSString *kATERCTypeImage;
extern NSString *kATERCTypePhotoGallery;
extern NSString *kATERCTypeWebview;
extern NSString *kATERCTypeMap;
extern NSString *kATERCTypeVideo;

///
/// ATERCView Notifications
///
extern NSString *kATERCNewAliasIncludedNotificationKey;

@interface ATERCConstants : NSObject
@end
