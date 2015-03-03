//
//  ATERichContentLabel.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERichContentComponentLabel.h"
#import "ATERichContentHelper.h"

@interface ATERichContentComponentLabel ()

@property (nonatomic, strong) NSString *mContent;

@end

@implementation ATERichContentComponentLabel

#pragma mark - ---- Internal
- (void) drawContent:(NSString *) content {
    self.mTextLabel.text = content;
    [self layoutIfNeeded];
}

#pragma mark - ---- Services
#pragma mark - ---- Overrides
+ (CGFloat) getWrapContentHeight {
    
}

- (BOOL) validateContent:(NSObject *)content {
    return [[content class] isSubclassOfClass:[NSString class]];
}

- (void) showContent:(NSObject *)content {
    if (![self validateContent:content]) {
        [[ATERichContentHelper getInstance] log:@"Invalid class type excepected for content into ATERichContentComponentLabel class"];
        return;
    }
    
    self.mContent = (NSString *) content;
    [self drawContent:self.mContent];
}

@end
