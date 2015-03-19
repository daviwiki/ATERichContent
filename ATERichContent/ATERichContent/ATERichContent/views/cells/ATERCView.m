//
//  ATERCView.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCView.h"
#import "ATERC.h"
#import "ATERCComponent.h"
#import "ATERCConstants.h"
#import "ATERCHelper.h"

@implementation ATERCView

+ (NSNumber *) getHeightForContent:(ATERC *) content
                      andComponent:(ATERCComponent *) compontent {
    if (content == nil || compontent == nil) {
        return @(0);
    }
    
    if (content.mRichContentHeight != kATERCWrapContentHeight) {
        return @(content.mRichContentHeight);
    }
    
    return @(0);
}

- (BOOL) validateContent:(NSObject *) content {
    return NO;
}

- (void) showContent:(NSObject *) content {
    
}

@end
