//
//  ATERCManager.h
//  ATERichContent
//
//  Created by David Martinez on 19/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ATERCComponent;

@interface ATERCManager : NSObject

/**
 * @function
 * addRichViewClassName:forAlias:
 * @brief Include a new class that could be inserted / created
 * into ATERCContainerView component. You could override an existing
 * alias with your own implementation.
 * @note all alias are defined into ATERCConstants.h class
 * @note if className not exists into project or not override
 * the "ATERCView" class, the new alias won't
 * be saved
 * @note examine logs to obtain more information if process failed
 * @param className, not null
 * @param alias, not null
 * @param reuseId, not null reuse id use for the cell
 * @return Return YES if the operation finish successfully
 */
- (BOOL) addRichViewClassName:(NSString *) className
                     forAlias:(NSString *) alias 
                      reuseId:(NSString *) reuseId;

/**
 * @function
 * addRichViewNibName:atBundle:forAlias
 * @brief Include a new nib class that could be inserted / created into
 * ATERCContainerView component. You could override an existing alias
 * with your own implementation
 * @note all alias are defined into ATERCConstants.h class
 * @note if nibname not exists into project or not override
 * the "ATERCView" class, the new alias won't
 * be saved
 * @note remember put into your UICollectionViewCell from your nib
 * the reuseId with the same name given by parameter into this method
 * @note examine logs to obtain more information if process failed
 * @param nibName, not null
 * @param bundle, could be null
 * @param reuseId, not null reuse id use for the cell
 * @return Return YES if the operation finish successfully
 */
- (BOOL) addRichViewNibName:(NSString *) nibName
                   atBundle:(NSBundle *) bundle
                   forAlias:(NSString *) alias
                    reuseId:(NSString *) reuseId;

/**
 * @function
 * @brief <p>Include a new compontent that could be inserted/created
 * into ATERCContainerView. You could override an existing alias
 * with your own implementation.
 * @note all alias are defined into ATERCConstants.h class
 * @note if className not exists into project or not override
 * the "ATERCView" class, the new alias won't
 * be saved
 * @note examine logs to obtain more information if process failed
 * @param component, not null
 * @return Return YES if the operation finish successfully
 */
- (BOOL) addRichViewComponent:(ATERCComponent *) component;

/**
 * @function setEnableLogs
 * @brief Enable/Disable ATERC logs
 */
- (void) setEnableLogs:(BOOL) enableLogs;

/**
 * @function
 * getInstance
 * @brief Return the unique single instance for ATERCManager
 */
+ (ATERCManager *) getInstance;

/**
 * @function
 * init
 * @note init method is unavailable for this class
 */
- (instancetype) init __attribute__((unavailable("init not available")));

@end
