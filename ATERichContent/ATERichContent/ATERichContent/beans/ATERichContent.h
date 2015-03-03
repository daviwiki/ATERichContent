//
//  ATERichContent.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ATERichContent : NSObject

@property (nonatomic, strong) NSString *mRichContentType;
@property (nonatomic, assign) CGFloat mRichContentHeight;
@property (nonatomic, strong) NSObject *mRichContentDatas;

@end
