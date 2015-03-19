//
//  ATERichContentHelper.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCHelper.h"
#import "ATERCComponent.h"
#import "ATERCConstants.h"
#import "ATERCView.h"

#import "ATERCLabelView.h"
#import "ATERCImageView.h"

static ATERCHelper *stInstance;

@interface ATERCHelper ()

@property (nonatomic, strong) NSMutableDictionary *mViewAliases;

@end

@implementation ATERCHelper

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) log:(NSString *) logMessage {
    if (logMessage.length == 0) {
        return;
    }
    
    NSLog(@"[ATE][%@] %@", NSStringFromClass([ATERCHelper class]), logMessage);
}

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
                                                 type:ATERichContentComponentTypeNib
                                                alias:alias
                                              reuseId:className];
    self.mViewAliases[alias] = c;
    
    alias = kATERCTypeImage;
    className = NSStringFromClass([ATERCImageView class]);
    c = [ATERCComponent getComponentWithName:className
                                                 type:ATERichContentComponentTypeNib
                                                alias:alias
                                              reuseId:className];
    self.mViewAliases[alias] = c;
}

- (BOOL) addRichViewClassName:(NSString *) className forAlias:(NSString *) alias reuseId:(NSString *)reuseId {
    if (!className || !alias || !reuseId) {
        [self log:@"No className, alias or reuseId defined"];
        return NO;
    }
    
    Class clazz = NSClassFromString(className);
    if (clazz == nil) {
        [self log:@"No class exists with this name"];
        return NO;
    } else if (![clazz isSubclassOfClass:[ATERCView class]]) {
        [self log:@"The class specified not inherits from ATERichContentComponentView"];
        return NO;
    }
    
    ATERCComponent *c = [ATERCComponent getComponentWithName:className
                                                                          type:ATERichContentComponentTypeClass
                                                                         alias:alias
                                                                       reuseId:reuseId];
    self.mViewAliases[alias] = c;
    
    return YES;
}

- (BOOL) addRichViewNibName:(NSString *) nibName atBundle:(NSBundle *) bundle forAlias:(NSString *) alias reuseId:(NSString *) reuseId {
    if (!nibName || !alias || !reuseId) {
        [self log:@"No nibname, alias or reuseId defined"];
        return NO;
    }
    
    UINib *nib = [UINib nibWithNibName:nibName bundle:bundle];
    if (!nib) {
        [self log:@"No nib defined with this name"];
        return NO;
    }
    
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] firstObject];
    if ([view.class isSubclassOfClass:[ATERCView class]]) {
        [self log:@"The class specified not inherits from ATERichContentComponentView"];
        return NO;
    }
    
    ATERCComponent *c = [ATERCComponent getComponentWithName:nibName
                                                                          type:ATERichContentComponentTypeNib
                                                                         alias:alias
                                                                       reuseId:reuseId];
    self.mViewAliases[alias] = c;
    return YES;
}

#pragma mark - -------------------- OVERRIDES ---------------------
#pragma mark - -------------------- DELEGATES ---------------------
#pragma mark - -------------------- LIFECICLE ---------------------
+ (ATERCHelper *) getInstance {
    if (!stInstance) {
        stInstance = [ATERCHelper alloc];
        [stInstance initializeHelper];
    }
    return stInstance;
}

@end
