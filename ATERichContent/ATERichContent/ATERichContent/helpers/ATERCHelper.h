//
//  ATERCHelper.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ATERC;
@class ATERCComponent;
@class ATERCView;

@interface ATERCHelper : NSObject

/**
 * @function
 * getHeightForContent:andCompontent:
 * @brief <p>Return a view height according to
 * the content and compontent given</p>. If somethings 
 * goes wrong return 0.
 * @param content, not null
 * @param compontent, not null
 */
+ (NSNumber *) getHeightForContent:(ATERC *) content
                      andComponent:(ATERCComponent *) compontent;

/**
 * @function
 * getViewForCompontent:
 * @brief <p>Return the view that conforms the compontent
 * given</p>
 */
+ (ATERCView *) getViewForCompontent:(ATERCComponent *) compontent;

/**
 * @function
 * getComponentForAlias:intoList:
 * @brief <p> Return the component for the alias given or nil
 * if alias not found </p>
 */
+ (ATERCComponent *) getComponentForAlias:(NSString *) alias
                                 intoList:(NSArray *) components;

@end
