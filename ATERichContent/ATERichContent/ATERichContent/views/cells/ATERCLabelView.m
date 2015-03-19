//
//  ATERCLabelView.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCLabelView.h"
#import "ATERCHeaders.h"

static ATERCLabelView *stDummyInstance;

@interface ATERCLabelView ()

@property (nonatomic, strong) ATERCLabel *mContent;

@end

@implementation ATERCLabelView

#pragma mark - ---- Internal
- (void) drawContent:(ATERCLabel *)content {
    self.mTextLabel.text = content.mText;
}

#pragma mark - ---- Services
#pragma mark - ---- Overrides
+ (NSNumber *) getHeightForContent:(ATERC *)content {
    if (!stDummyInstance) {
        NSArray *aliases = [[[ATERCManager getInstance] getAvailableCompontents] allValues];
        ATERCComponent *c = [ATERCHelper getComponentForAlias:kATERCTypeLabel intoList:aliases];
        stDummyInstance = (ATERCLabelView *)[ATERCHelper getViewForCompontent:c];
    }
    
    CGRect frame = stDummyInstance.frame;
    frame.size.width = content.mRichContentWidth;
    stDummyInstance.frame = frame;
    
    [stDummyInstance showContent:content];
    CGRect rect = [stDummyInstance.mTextLabel.text boundingRectWithSize:CGSizeMake(stDummyInstance.mTextLabel.frame.size.width, MAXFLOAT)
                                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                             attributes:@{
                                                                          NSFontAttributeName:stDummyInstance.mTextLabel.font
                                                                          }
                                                                context:nil];
    
    
    return @(rect.size.height);
}

- (BOOL) validateContent:(ATERC *)content {
    return [[content class] isSubclassOfClass:[ATERCLabel class]];
}

- (void) showContent:(ATERCLabel *)content {
    if (![self validateContent:content]) {
        [ATERCLog log:@"Invalid class type excepected for content into ATERCLabelView class"];
        return;
    }
    
    self.mContent = content;
    [self drawContent:self.mContent];
}

@end
