//
//  ATERC.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ATERC : NSObject

/**
 * @property
 * mRichContentType
 * @brief The string that identifies one of the types
 * avialables for a ATERCView component. You can
 * find this possible values at ATERichContentConstants.h
 * with preffix "kATERCCompontentType***" where
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

/**
 * @property
 * mRichContentWidth
 * @brief Width for the component. If no width
 * is specfied the system decides the default width
 */
@property (nonatomic, assign) CGFloat mRichContentWidth;

@end
