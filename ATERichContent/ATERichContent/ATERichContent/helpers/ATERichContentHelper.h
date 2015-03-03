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
 * into ATERichContentView component. You could override and exiting
 * alias with your own implementation.
 * @note all alias are defined into ATERichContentConstant.h class
 * @note if className not exists into project or not override
 * the "ATERichContentCompomentView" class, the new alias won't
 * be saved
 * @param className, not null
 * @param alias, not null
 * @return Return YES if the operation finish successfully
 */
- (BOOL) addRichViewClassName:(NSString *) className forAlias:(NSString *) alias;

+ (ATERichContentHelper *) getInstance;

@end
