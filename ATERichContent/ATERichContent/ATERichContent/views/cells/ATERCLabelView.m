//
//  ATERichContentLabel.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCLabelView.h"
#import "ATERCHelper.h"

static ATERCLabelView *stDummyInstance;

@interface ATERCLabelView ()

@property (nonatomic, strong) NSString *mContent;

@end

@implementation ATERCLabelView

#pragma mark - ---- Internal
- (void) drawContent:(NSString *) content {
    self.mTextLabel.text = content;
    [self layoutIfNeeded];
}

#pragma mark - ---- Services
#pragma mark - ---- Overrides
+ (CGFloat) getWrapContentHeight {
//    if (!stDummyInstance) {
//        NSString *className = NSStringFromClass([ATERichContentComponentLabel class]);
//        stDummyInstance = [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil] firstObject];
//    }
//    
//    stDummyInstance
    
    return 0;
}

- (BOOL) validateContent:(NSObject *)content {
    return [[content class] isSubclassOfClass:[NSString class]];
}

- (void) showContent:(NSObject *)content {
    if (![self validateContent:content]) {
        [[ATERCHelper getInstance] log:@"Invalid class type excepected for content into ATERichContentComponentLabel class"];
        return;
    }
    
    self.mContent = (NSString *) content;
    [self drawContent:self.mContent];
}

@end
