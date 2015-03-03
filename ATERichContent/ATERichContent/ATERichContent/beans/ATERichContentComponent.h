//
//  ATARichContentComponent.h
//  ATERichContent
//
//  Created by David Martinez on 3/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATERichContentConstants.h"

@interface ATERichContentComponent : NSObject

@property (nonatomic, strong) NSString *mName; // class name or nib name
@property (nonatomic, assign) ATERichContentComponentType mType;
@property (nonatomic, strong) NSString *mAlias;
@property (nonatomic, strong) NSString *mReuseId;

// Nib registration
@property (nonatomic, strong) NSBundle *mBundle;

+ (ATERichContentComponent *) getComponentWithName:(NSString *) name
                                              type:(ATERichContentComponentType) type
                                             alias:(NSString *) alias
                                           reuseId:(NSString *) reuseId;

@end
