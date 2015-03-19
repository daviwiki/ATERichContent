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

/**
 * @property mName
 * @brief <p>machine class name or nib name</p>
 */
@property (nonatomic, strong) NSString *mName;

/**
 * @property mType
 * @brief <p>component type {ATERCComponentTypeClass, ATERCComponentTypeNib}</p>
 */
@property (nonatomic, assign) ATERCComponentType mType;

/**
 * @property mAlias
 * @brief <p>Human readable name</p>
 */
@property (nonatomic, strong) NSString *mAlias;

/**
 * @property mReuseId
 * @brief <p>use like id for the collection view cells</p>
 */
@property (nonatomic, strong) NSString *mReuseId;

/**
 * @property mBundle
 * @brief <p>for nibs, bundle where is located the nib</p>
 */
@property (nonatomic, strong) NSBundle *mBundle;

@end
