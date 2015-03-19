//
//  ATARichContentComponent.m
//  ATERichContent
//
//  Created by David Martinez on 3/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCComponent.h"

@implementation ATERCComponent

+ (ATERCComponent *) getComponentWithName:(NSString *) name
                                              type:(ATERCComponentType) type
                                             alias:(NSString *) alias
                                           reuseId:(NSString *) reuseId {
    if (!name || !alias || !reuseId) {
        return nil;
    }
    
    ATERCComponent *component = [[ATERCComponent alloc] init];
    component.mName = name;
    component.mType = type;
    component.mAlias = alias;
    component.mReuseId = reuseId;
    return component;
}

@end
