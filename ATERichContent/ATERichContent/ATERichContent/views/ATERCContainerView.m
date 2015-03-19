//
//  ATERCContainerView.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCContainerView.h"

@interface ATERCContainerView ()

@end

@implementation ATERCContainerView

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) mountViews {
    /// TODO: Mount view structure (collectionView)
}

#pragma mark - ---- Services
- (void) appendItem:(ATERC *) content {
    
}

- (void) appendItem:(ATERC *)content atIndex:(NSUInteger) index {
    
}

- (void) clean {
    
}

- (void) showContent:(NSArray *) contents {
    
}

#pragma mark - -------------------- OVERRIDES ---------------------
#pragma mark - -------------------- DELEGATES ---------------------
#pragma mark - -------------------- LIFECICLE ---------------------
- (id) init {
    self = [super init];
    if (self) {
        [self mountViews];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self mountViews];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self mountViews];
    }
    return self;
}

- (void) awakeFromNib {
    [super awakeFromNib];
    [self mountViews];
}

@end
