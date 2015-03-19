//
//  ATERCLog.h
//  ATERichContent
//
//  Created by David Martinez on 19/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATERCLog : NSObject

/**
 * @function setEnableLogs:
 * @brief <p>Enable/Disable ATERC logs. By default
 * logs are disabled </p>
 */
+ (void) setEnableLogs:(BOOL) enabled;

/**
 * @function log:
 * @brief <p>Print a log message with the information given</p>
 */
+ (void) log:(NSString *) message;

@end
