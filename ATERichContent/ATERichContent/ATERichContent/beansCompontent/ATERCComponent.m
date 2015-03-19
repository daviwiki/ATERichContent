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

- (NSString *) debugDescription {
    return [NSString stringWithFormat:@"[ATERCComponent][%p][alias:%@, name:%@, type:%i, reuseId:%@]",
            self, self.mAlias, self.mName, self.mType, self.mReuseId];
}

@end
