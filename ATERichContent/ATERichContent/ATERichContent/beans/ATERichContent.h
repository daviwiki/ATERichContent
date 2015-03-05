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

/**
 * @property
 * mRichContentType
 * @brief The string that identifies one of the types
 * avialables for a ATERichContentView component. You can
 * find this possible values at ATERichContentConstants.h
 * with preffix "kATERichContentComponentType***" where
 * xxx represents an available ATE-local type.
 */
@property (nonatomic, strong) NSString *mRichContentType;

/**
 * @property
 * mRichContentHeight
 * @brief Height for the component. If no height / wrap_content
 * is specfied the system decides the default height
 */
@property (nonatomic, assign) CGFloat mRichContentHeight;

@end
