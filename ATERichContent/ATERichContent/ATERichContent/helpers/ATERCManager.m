//
//  ATERCManager.m
//  ATERichContent
//
//  Created by David Martinez on 19/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCManager.h"
#import "ATERCComponent.h"
#import "ATERCConstants.h"
#import "ATERCView.h"

#import "ATERCLabelView.h"
#import "ATERCImageView.h"
#import "ATERCLog.h"

static ATERCManager *stInstance;

@interface ATERCManager ()

@property (nonatomic, strong) NSMutableDictionary *mViewAliases;

@end

@implementation ATERCManager

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Services
- (void) initializeHelper {
    // Add default components to matrix
    self.mViewAliases = [[NSMutableDictionary alloc] init];
    
    ATERCComponent *c = nil;
    NSString *className = nil;
    NSString *alias = nil;
    
    alias = kATERCTypeLabel;
    className = NSStringFromClass([ATERCLabelView class]);
    c = [ATERCComponent getComponentWithName:className
                                        type:ATERCComponentTypeNib
                                       alias:alias
                                     reuseId:className];
    self.mViewAliases[alias] = c;
    
    alias = kATERCTypeImage;
    className = NSStringFromClass([ATERCImageView class]);
    c = [ATERCComponent getComponentWithName:className
                                        type:ATERCComponentTypeNib
                                       alias:alias
                                     reuseId:className];
    self.mViewAliases[alias] = c;
}

- (BOOL) addRichViewClassName:(NSString *) className forAlias:(NSString *) alias reuseId:(NSString *)reuseId {
    if (!className || !alias || !reuseId) {
        [ATERCLog log:@"No className, alias or reuseId defined"];
        return NO;
    }
    
    Class clazz = NSClassFromString(className);
    if (clazz == nil) {
        [ATERCLog log:@"No class exists with this name"];
        return NO;
    } else if (![clazz isSubclassOfClass:[ATERCView class]]) {
        [ATERCLog log:@"The class specified not inherits from ATERichContentComponentView"];
        return NO;
    }
    
    ATERCComponent *c = [ATERCComponent getComponentWithName:className
                                                        type:ATERCComponentTypeClass
                                                       alias:alias
                                                     reuseId:reuseId];
    self.mViewAliases[alias] = c;
    
    return YES;
}

- (BOOL) addRichViewNibName:(NSString *) nibName atBundle:(NSBundle *) bundle forAlias:(NSString *) alias reuseId:(NSString *) reuseId {
    if (!nibName || !alias || !reuseId) {
        [ATERCLog log:@"No nibname, alias or reuseId defined"];
        return NO;
    }
    
    UINib *nib = [UINib nibWithNibName:nibName bundle:bundle];
    if (!nib) {
        [ATERCLog log:@"No nib defined with this name"];
        return NO;
    }
    
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] firstObject];
    if ([view.class isSubclassOfClass:[ATERCView class]]) {
        [ATERCLog log:@"The class specified not inherits from ATERichContentComponentView"];
        return NO;
    }
    
    ATERCComponent *c = [ATERCComponent getComponentWithName:nibName
                                                        type:ATERCComponentTypeNib
                                                       alias:alias
                                                     reuseId:reuseId];
    self.mViewAliases[alias] = c;
    return YES;
}

- (void) setEnableLogs:(BOOL) enableLogs {
    [ATERCLog setEnableLogs:enableLogs];
}

#pragma mark - -------------------- OVERRIDES ---------------------
#pragma mark - -------------------- DELEGATES ---------------------
#pragma mark - -------------------- LIFECICLE ---------------------
+ (ATERCManager *) getInstance {
    if (!stInstance) {
        stInstance = [ATERCManager alloc];
        [stInstance initializeHelper];
    }
    return stInstance;
}

@end
