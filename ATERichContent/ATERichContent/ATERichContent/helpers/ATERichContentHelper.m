//
//  ATERichContentHelper.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERichContentHelper.h"
#import "ATERichContentConstants.h"
#import "ATERichContentComponentView.h"
#import "ATERichContentComponentLabel.h"

static ATERichContentHelper *stInstance;

@interface ATERichContentHelper ()

@property (nonatomic, strong) NSMutableDictionary *mViewAliases;

@end

@implementation ATERichContentHelper

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) log:(NSString *) logMessage {
    if (logMessage.length == 0) {
        return;
    }
    
    NSLog(@"[ATE][%@] %@", NSStringFromClass([ATERichContentHelper class]), logMessage);
}

#pragma mark - ---- Services
- (void) initializeHelper {
    self.mViewAliases = [[NSMutableDictionary alloc] init];
    self.mViewAliases[kATERichContentComponentLabel] = NSStringFromClass([ATERichContentComponentLabel class]);
}

- (BOOL) addRichViewClassName:(NSString *) className forAlias:(NSString *) alias {
    if (!className || !alias) {
        [self log:@"No className or alias defined"];
        return NO;
    }
    
    Class clazz = NSClassFromString(className);
    if (clazz == nil) {
        [self log:@"No class exists with this name"];
        return NO;
    } else if (![clazz isSubclassOfClass:[ATERichContentComponentView class]]) {
        [self log:@"The class specified not inherits from ATERichContentComponentView"];
        return NO;
    }
    
    return YES;
}

#pragma mark - -------------------- OVERRIDES ---------------------
#pragma mark - -------------------- DELEGATES ---------------------
#pragma mark - -------------------- LIFECICLE ---------------------
+ (ATERichContentHelper *) getInstance {
    if (!stInstance) {
        stInstance = [[ATERichContentHelper alloc] init];
        [stInstance initializeHelper];
    }
    return stInstance;
}

@end
