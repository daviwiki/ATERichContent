//
//  ATARichContentComponent.m
//  ATERichContent
//
//  Created by David Martinez on 3/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERichContentComponent.h"

@implementation ATERichContentComponent

+ (ATERichContentComponent *) getComponentWithName:(NSString *) name
                                              type:(ATERichContentComponentType) type
                                             alias:(NSString *) alias
                                           reuseId:(NSString *) reuseId {
    if (!name || !alias || !reuseId) {
        return nil;
    }
    
    ATERichContentComponent *component = [[ATERichContentComponent alloc] init];
    component.mName = name;
    component.mType = type;
    component.mAlias = alias;
    component.mReuseId = reuseId;
    return component;
}

@end
