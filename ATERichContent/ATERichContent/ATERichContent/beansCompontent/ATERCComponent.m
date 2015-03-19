//
//  ATARCComponent.m
//  ATERichContent
//
//  Created by David Martinez on 3/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCComponent.h"

@implementation ATERCComponent

- (BOOL) isEqual:(ATERCComponent *)object {
    return [self.mAlias isEqualToString:object.mAlias];
}

@end
