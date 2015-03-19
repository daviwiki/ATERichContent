//
//  ATERCLog.m
//  ATERichContent
//
//  Created by David Martinez on 19/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCLog.h"

static BOOL stEnabled = NO;

@implementation ATERCLog

+ (void) setEnableLogs:(BOOL) enabled {
    stEnabled = enabled;
}

+ (void) log:(NSString *) message {
    if (!stEnabled || message.length == 0) {
        return;
    }
    
    NSLog(@"[ATE][%@] %@", NSStringFromClass([ATERCLog class]), message);
}

@end
