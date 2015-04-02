//
//  ATERCOverrideCell.m
//  ATERichContent
//
//  Created by David Martinez on 2/4/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCOverrideCell.h"
#import "ATERCHeaders.h"

@interface ATERCOverrideCell ()

/// Outlets
@property (nonatomic, weak) IBOutlet UILabel *mTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *mSubtitleLabel;

/// Datas
@property (nonatomic, strong) ATERCLabel *mContent;

@end

@implementation ATERCOverrideCell

#pragma mark - ---- Internal
- (void) drawContent:(ATERCLabel *) content {
    self.mTitleLabel.text = [NSString stringWithFormat:@"Override %i", arc4random()];
    self.mSubtitleLabel.text = [NSString stringWithFormat:@"Override - %@", content.mText];
}

#pragma mark - ---- Overrides
+ (NSNumber *) getHeightForContent:(ATERC *)content {
    return @(120.0f);
}

- (BOOL) validateContent:(ATERC *)content {
    return [[content class] isSubclassOfClass:[ATERCLabel class]];
}

- (void) showContent:(ATERC *)content {
    if (![self validateContent:content]) {
        [ATERCLog log:@"Invalid class type excepected for content into ATERCOverrideCell class"];
        return;
    }
    
    self.mContent = (ATERCLabel *)content;
    [self drawContent:self.mContent];
}

@end
