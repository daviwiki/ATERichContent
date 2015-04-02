//
//  ATERCCustomCell.m
//  ATERichContent
//
//  Created by David Martinez on 2/4/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCCustomCell.h"
#import "ATERCHeaders.h"

@interface ATERCCustomCell ()

/// Outlets
@property (nonatomic, weak) IBOutlet UILabel *mTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *mSubtitleLabel;

/// Datas
@property (nonatomic, strong) ATERC *mContent;

@end

@implementation ATERCCustomCell

#pragma mark - ---- Internal
- (void) drawContent:(ATERC *) content {
    self.mTitleLabel.text = [NSString stringWithFormat:@"Custom %i", arc4random()];
    self.mSubtitleLabel.text = [NSString stringWithFormat:@"Custom Lorem ipsum sample %i", arc4random()];
}

#pragma mark - ---- Overrides
+ (NSNumber *) getHeightForContent:(ATERC *)content {
    return @(120.0f);
}

- (BOOL) validateContent:(ATERC *)content {
    return [[content class] isSubclassOfClass:[ATERC class]];
}

- (void) showContent:(ATERCLabel *)content {
    if (![self validateContent:content]) {
        [ATERCLog log:@"Invalid class type excepected for content into ATERCCustomCell class"];
        return;
    }
    
    self.mContent = content;
    [self drawContent:self.mContent];
}

@end
