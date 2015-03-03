//
//  ATERichContentHelper.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATERichContentHelper : NSObject

/**
 * @function
 * addRichViewClassName:forAlias:
 * @brief Include a new class that could be inserted / created
 * into ATERichContentView component. You could override and existing
 * alias with your own implementation.
 * @note all alias are defined into ATERichContentConstant.h class
 * @note if className not exists into project or not override
 * the "ATERichContentCompomentView" class, the new alias won't
 * be saved
 * @param className, not null
 * @param alias, not null
 * @param reuseId, not null reuse id use for the cell
 * @return Return YES if the operation finish successfully
 */
- (BOOL) addRichViewClassName:(NSString *) className forAlias:(NSString *) alias reuseId:(NSString *) reuseId;

/**
 * @function
 * addRichViewNibName:atBundle:forAlias
 * @brief Include a new nib class that could be inserted / created into
 * ATARichContentView component. You could override and existing alias
 * with your own implementation
 * @note all alias are defined into ATERichContentConstant.h class
 * @note if nibname not exists into project or not override
 * the "ATERichContentCompomentView" class, the new alias won't
 * be saved
 * @note remember put into your UICollectionViewCell from your nib
 * the reuseId with the same name given by parameter into this method
 * @param nibName, not null
 * @param bundle, could be null
 * @param reuseId, not null reuse id use for the cell
 * @return Return YES if the operation finish successfully
 */
- (BOOL) addRichViewNibName:(NSString *) nibName atBundle:(NSBundle *) bundle forAlias:(NSString *) alias reuseId:(NSString *) reuseId;

/**
 * @function
 * log:
 * @brief Print a log message with the information given
 */
- (void) log:(NSString *) logMessage;

/**
 * @function
 * getInstance
 * @brief Return the unique single instance for ATERichContentHelper
 */
+ (ATERichContentHelper *) getInstance;

/**
 * @function
 * init
 * @note init method is unavailable for this class
 */
- (instancetype) init __attribute__((unavailable("init not available")));

@end
