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
#import "ATERCAttributedLabelView.h"
#import "ATERCLog.h"

static ATERCManager *stInstance;

@interface ATERCManager ()

@property (nonatomic, strong) NSMutableDictionary *mViewAliases;

@end

@implementation ATERCManager

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) initializeManager {
    self.mViewAliases = [[NSMutableDictionary alloc] init];
    
    ATERCComponent *c = nil;
    c = [[ATERCComponent alloc] init];
    c.mName = NSStringFromClass([ATERCLabelView class]);
    c.mType = ATERCComponentTypeNib;
    c.mAlias = kATERCTypeLabel;
    c.mReuseId = kATERCTypeLabel;
    [self addRichViewComponent:c];
    
    c = [[ATERCComponent alloc] init];
    c.mName = NSStringFromClass([ATERCImageView class]);
    c.mType = ATERCComponentTypeNib;
    c.mAlias = kATERCTypeImage;
    c.mReuseId = kATERCTypeImage;
    [self addRichViewComponent:c];
    
    c = [[ATERCComponent alloc] init];
    c.mName = NSStringFromClass([ATERCAttributedLabelView class]);
    c.mType = ATERCComponentTypeNib;
    c.mAlias = kATERCTypeAttributtedLabel;
    c.mReuseId = kATERCTypeAttributtedLabel;
    [self addRichViewComponent:c];
}

#pragma mark - ---- Services
- (BOOL) addRichViewComponent:(ATERCComponent *) component {
    if (!component.mName) {
        [ATERCLog log:@"No class/nib name defined"];
        return NO;
    }
    if (!component.mAlias) {
        [ATERCLog log:@"No alias defined"];
        return NO;
    }
    if (!component.mReuseId) {
        [ATERCLog log:@"No reuseId defined"];
        return NO;
    }
    
    if (component.mType == ATERCComponentTypeClass) {
        Class clazz = NSClassFromString(component.mName);
        if (clazz == nil) {
            [ATERCLog log:@"No class exists with this name"];
            return NO;
        } else if (![clazz isSubclassOfClass:[ATERCView class]]) {
            [ATERCLog log:@"The class specified not inherits from ATERCView"];
            return NO;
        }
    } else {
        UINib *nib = [UINib nibWithNibName:component.mName bundle:component.mBundle];
        if (!nib) {
            [ATERCLog log:@"No nib defined with this name"];
            return NO;
        }
        
        @try {
            UIView *view = [[nib instantiateWithOwner:nil options:nil] firstObject];
            if (![view.class isSubclassOfClass:[ATERCView class]]) {
                [ATERCLog log:@"The class specified not inherits from ATERCView"];
                return NO;
            }
        } @catch (NSException *exception) {
            [ATERCLog log:@"No nib defined with this name"];
            return NO;
        }
    }
    
    self.mViewAliases[component.mAlias] = component;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kATERCNewAliasIncludedNotificationKey
                                                        object:nil
                                                      userInfo:@{kATERCNewAliasIncludedNotificationKey:component}];
    
    return YES;
}

- (BOOL) addRichViewClassName:(NSString *) className forAlias:(NSString *) alias reuseId:(NSString *)reuseId {
    ATERCComponent *c = [[ATERCComponent alloc] init];
    c.mName = className;
    c.mType = ATERCComponentTypeClass;
    c.mAlias = alias;
    c.mReuseId = reuseId;
    return [self addRichViewComponent:c];
}

- (BOOL) addRichViewNibName:(NSString *) nibName atBundle:(NSBundle *) bundle forAlias:(NSString *) alias reuseId:(NSString *) reuseId {
    ATERCComponent *c = [[ATERCComponent alloc] init];
    c.mName = nibName;
    c.mType = ATERCComponentTypeNib;
    c.mAlias = alias;
    c.mReuseId = reuseId;
    c.mBundle = bundle;
    return [self addRichViewComponent:c];
}

- (NSDictionary *) getAvailableCompontents {
    return self.mViewAliases;
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
        [stInstance initializeManager];
    }
    return stInstance;
}

@end
