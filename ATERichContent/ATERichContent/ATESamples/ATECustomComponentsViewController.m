//
//  ATECustomComponentsViewController.m
//  ATERichContent
//
//  Created by David Martinez on 29/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATECustomComponentsViewController.h"
#import "ATERCHeaders.h"

@interface ATECustomComponentsViewController ()

/// Outlets
@property (nonatomic, weak) IBOutlet ATERCContainerView *mRCView;

/// Datas
@property (nonatomic, strong) NSArray *mSampleTexts;

@end

@implementation ATECustomComponentsViewController

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Internal
- (void) mountViews {
    self.mSampleTexts = @[@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum varius sem eget leo interdum, et blandit nisl tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla sit amet tristique est. Nulla scelerisque at lorem ut iaculis. Pellentesque quis arcu suscipit arcu gravida interdum sed quis urna. Ut faucibus purus non fermentum dignissim. Suspendisse eu pellentesque nisi. Aenean in enim sem.",
                          @"Nam id congue tellus. Nullam ac egestas ipsum, sit amet consectetur risus. Ut porta venenatis massa quis ultrices. Donec est neque, scelerisque ac tellus in, ornare venenatis leo. Aliquam efficitur lacinia nibh ac commodo. Ut aliquet auctor rutrum. Pellentesque ac enim ac nulla egestas sodales. In justo dui, dapibus a venenatis id, vehicula sed lorem. In at rhoncus orci. Phasellus nec leo ex. Ut nec fringilla metus. Nam a arcu feugiat, sodales est quis, facilisis tellus.",
                          @"Donec congue consequat egestas. Vestibulum vitae porttitor mi. Mauris lobortis nec risus vitae rutrum. Nullam lectus nibh, vulputate id feugiat a, consequat non lacus. Morbi eleifend arcu at malesuada dictum. Cras malesuada sagittis risus fringilla eleifend. Cras vehicula, ex eget tempus malesuada, lectus enim suscipit erat, nec rutrum metus massa ac lacus. Maecenas porta tortor a ullamcorper volutpat. Pellentesque eros sem, ullamcorper sit amet sapien ut, rutrum placerat quam. Curabitur in feugiat nisl. Sed pharetra nunc ex, quis tristique leo condimentum vel. Etiam vel volutpat nunc. Mauris dictum tristique metus at imperdiet. Nulla vel aliquet tellus. Nulla ultricies metus lorem, consequat luctus metus mattis ac. Nulla est tortor, vestibulum a accumsan in, tincidunt a eros."];
    
    ATERCManager *manager = [ATERCManager getInstance];
    [manager addRichViewNibName:@"ATERCCustomCell" atBundle:nil forAlias:@"CUSTOM" reuseId:@"CUSTOM"];
    [manager addRichViewNibName:@"ATERCOverrideCell" atBundle:nil forAlias:kATERCTypeLabel reuseId:kATERCTypeLabel];
}

#pragma mark - ---- Services
#pragma mark - ---- Actions
- (IBAction) actionAddCustomCell:(id)sender {
    ATERC *rc = [[ATERC alloc] init];
    rc.mRichContentType = @"CUSTOM";
    rc.mRichContentHeight = kATERCWrapContentHeight;
    
    [self.mRCView appendItem:rc];
}

- (IBAction) actionAddOverrideCell:(id)sender {
    ATERCLabel *rc = [[ATERCLabel alloc] init];
    rc.mRichContentType = kATERCTypeLabel /* == TXT */;
    rc.mRichContentHeight = kATERCWrapContentHeight;
    ((ATERCLabel *)rc).mText = self.mSampleTexts[arc4random() % self.mSampleTexts.count];
    
    [self.mRCView appendItem:rc];
}

#pragma mark - -------------------- OVERRIDES ---------------------
#pragma mark - -------------------- DELEGATES ---------------------
#pragma mark - -------------------- LIFECICLE ---------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    [self mountViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
