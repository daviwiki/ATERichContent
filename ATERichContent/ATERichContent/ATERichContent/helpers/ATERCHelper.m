//
//  ATERCHelper.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCHelper.h"
#import "ATERCManager.h"
#import "ATERCComponent.h"
#import "ATERCView.h"
#import "ATERC.h"

static NSMutableDictionary *stAliasToClassRelations = nil;

@implementation ATERCHelper

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
+ (NSNumber *) getClassHeightForContent:(ATERC *) content
                           andClassName:(NSString *) className {
    Class clazz = NSClassFromString(className);
    
    SEL selector = @selector(getHeightForContent:);
    
    NSNumber *height = @(0);
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([clazz respondsToSelector:selector]) {
        height = [clazz performSelector:selector withObject:content];
    }
    #pragma clang diagnostic pop
    return height;
}

+ (NSNumber *) getNibHeightForContent:(ATERC *) content
                         andComponent:(ATERCComponent *) compontent {
    NSString *className = stAliasToClassRelations[compontent.mAlias];
    if (className) {
        return [ATERCHelper getClassHeightForContent:content andClassName:className];
    }
    
    UINib *nib = [UINib nibWithNibName:compontent.mName bundle:compontent.mBundle];
    ATERCView *view = (ATERCView *)[[nib instantiateWithOwner:nil options:nil] firstObject];
    className = NSStringFromClass(view.class);
    if (!className) {
        return @(0);
    }
    
    stAliasToClassRelations[compontent.mAlias] = className;
    return [ATERCHelper getClassHeightForContent:content andClassName:className];
}

#pragma mark - ---- Services
+ (NSNumber *) getHeightForContent:(ATERC *) content
                      andComponent:(ATERCComponent *) compontent {
    if (content.mRichContentHeight != kATERCWrapContentHeight) {
        return @(content.mRichContentHeight);
    }
    
    if (compontent.mType == ATERCComponentTypeClass) {
        return [ATERCHelper getClassHeightForContent:content andClassName:compontent.mName];
    }
    if (compontent.mType == ATERCComponentTypeNib) {
        return [ATERCHelper getNibHeightForContent:content andComponent:compontent];
    }
    return @(0);
}

+ (ATERCView *) getViewForCompontent:(ATERCComponent *) compontent {
    if (compontent.mType == ATERCComponentTypeClass) {
        Class clazz = NSClassFromString(compontent.mName);
        return [[clazz alloc] init];
    } else if (compontent.mType == ATERCComponentTypeNib) {
        UINib *nib = [UINib nibWithNibName:compontent.mName bundle:compontent.mBundle];
        return (ATERCView *)[[nib instantiateWithOwner:nil options:nil] firstObject];
    }
    return nil;
}

+ (ATERCComponent *) getComponentForAlias:(NSString *) alias
                                 intoList:(NSArray *) components {
    for (ATERCComponent *c in components) {
        if ([c.mAlias isEqualToString:alias]) {
            return c;
        }
    }
    return nil;
}

@end
