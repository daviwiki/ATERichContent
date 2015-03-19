//
//  ATERCLabelView.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCLabelView.h"
#import "ATERCManager.h"
#import "ATERCLog.h"
#import "ATERCLabel.h"
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
+ (NSNumber *) getHeightForContent:(ATERC *)content andComponent:(ATERCComponent *)compontent {
    if (!stDummyInstance) {
        stDummyInstance = (ATERCLabelView *)[ATERCHelper getViewForCompontent:compontent];
    }
    
    CGRect frame = stDummyInstance.frame;
    frame.size.width = content.mRichContentWidth;
    stDummyInstance.frame = frame;
    
    [stDummyInstance showContent:content];
    [stDummyInstance layoutIfNeeded];
    
    return @(stDummyInstance.mTextLabel.frame.size.height);
}

- (BOOL) validateContent:(ATERC *)content {
    return [[content class] isSubclassOfClass:[ATERCLabel class]];
}

- (void) showContent:(ATERC *)content {
    if (![self validateContent:content]) {
        [ATERCLog log:@"Invalid class type excepected for content into ATERCLabelView class"];
        return;
    }
    
    self.mContent = (NSString *) content;
    [self drawContent:self.mContent];
}

@end
