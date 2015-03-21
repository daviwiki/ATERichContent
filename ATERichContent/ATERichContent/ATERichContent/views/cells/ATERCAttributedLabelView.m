//
//  ATERCAttributedLabelView.m
//  ATERichContent
//
//  Created by David Martinez on 21/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCAttributedLabelView.h"
#import "ATERCHeaders.h"

static ATERCAttributedLabelView *stDummyInstance;

@interface ATERCAttributedLabelView ()

@property (nonatomic, strong) ATERCAttributtedLabel *mContent;

@end

@implementation ATERCAttributedLabelView

#pragma mark - ---- Internal
- (void) drawContent:(ATERCAttributtedLabel *)content {
    self.mTextLabel.attributedText = content.mAttributedText;
}

#pragma mark - ---- Services
#pragma mark - ---- Overrides
+ (NSNumber *) getHeightForContent:(ATERC *)content {
    if (!stDummyInstance) {
        NSArray *aliases = [[[ATERCManager getInstance] getAvailableCompontents] allValues];
        ATERCComponent *c = [ATERCHelper getComponentForAlias:kATERCTypeAttributtedLabel intoList:aliases];
        stDummyInstance = (ATERCAttributedLabelView *)[ATERCHelper getViewForCompontent:c];
    }
    
    CGRect frame = stDummyInstance.frame;
    frame.size.width = content.mRichContentWidth;
    stDummyInstance.frame = frame;
    
    [stDummyInstance showContent:content];
    CGFloat width = stDummyInstance.mTextLabel.frame.size.width;
    CGRect rect = [stDummyInstance.mTextLabel.attributedText boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                                                          options:NSStringDrawingUsesLineFragmentOrigin
                                                                          context:nil];
    
    return @(rect.size.height);
}

- (BOOL) validateContent:(ATERC *)content {
    return [[content class] isSubclassOfClass:[ATERCAttributtedLabel class]];
}

- (void) showContent:(ATERCAttributtedLabel *)content {
    if (![self validateContent:content]) {
        [ATERCLog log:@"Invalid class type excepected for content into ATERCAttributtedLabel class"];
        return;
    }
    
    self.mContent = content;
    [self drawContent:self.mContent];
}

@end
