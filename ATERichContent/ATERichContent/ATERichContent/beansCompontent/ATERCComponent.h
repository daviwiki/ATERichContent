//
//  ATARCComponent.h
//  ATERichContent
//
//  Created by David Martinez on 3/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATERCConstants.h"

@interface ATERCComponent : NSObject

@property (nonatomic, strong) NSString *mName;          // class name or nib name
@property (nonatomic, assign) ATERCComponentType mType;
@property (nonatomic, strong) NSString *mAlias;         // human-readable name
@property (nonatomic, strong) NSString *mReuseId;       // reuseId for collection view

// Nib registration
@property (nonatomic, strong) NSBundle *mBundle;        // for nibs, bundle where is located the nib

@end
