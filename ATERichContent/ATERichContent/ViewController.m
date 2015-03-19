//
//  ViewController.m
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ViewController.h"
#import "ATERCHeaders.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet ATERCContainerView *mRCView;

@property (nonatomic, strong) NSArray *mSimpleTexts;

@end

@implementation ViewController

- (void) mountStubs {
    self.mSimpleTexts = @[@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum varius sem eget leo interdum, et blandit nisl tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla sit amet tristique est. Nulla scelerisque at lorem ut iaculis. Pellentesque quis arcu suscipit arcu gravida interdum sed quis urna. Ut faucibus purus non fermentum dignissim. Suspendisse eu pellentesque nisi. Aenean in enim sem.",
        @"Nam id congue tellus. Nullam ac egestas ipsum, sit amet consectetur risus. Ut porta venenatis massa quis ultrices. Donec est neque, scelerisque ac tellus in, ornare venenatis leo. Aliquam efficitur lacinia nibh ac commodo. Ut aliquet auctor rutrum. Pellentesque ac enim ac nulla egestas sodales. In justo dui, dapibus a venenatis id, vehicula sed lorem. In at rhoncus orci. Phasellus nec leo ex. Ut nec fringilla metus. Nam a arcu feugiat, sodales est quis, facilisis tellus.",
        @"Donec congue consequat egestas. Vestibulum vitae porttitor mi. Mauris lobortis nec risus vitae rutrum. Nullam lectus nibh, vulputate id feugiat a, consequat non lacus. Morbi eleifend arcu at malesuada dictum. Cras malesuada sagittis risus fringilla eleifend. Cras vehicula, ex eget tempus malesuada, lectus enim suscipit erat, nec rutrum metus massa ac lacus. Maecenas porta tortor a ullamcorper volutpat. Pellentesque eros sem, ullamcorper sit amet sapien ut, rutrum placerat quam. Curabitur in feugiat nisl. Sed pharetra nunc ex, quis tristique leo condimentum vel. Etiam vel volutpat nunc. Mauris dictum tristique metus at imperdiet. Nulla vel aliquet tellus. Nulla ultricies metus lorem, consequat luctus metus mattis ac. Nulla est tortor, vestibulum a accumsan in, tincidunt a eros."
        ];
}

- (IBAction) actionInsertATERCItem:(id)sender {
    ATERCLabel *rc = [[ATERCLabel alloc] init];
    rc.mRichContentType = kATERCTypeLabel;
    rc.mRichContentHeight = kATERCWrapContentHeight;
    rc.mText = self.mSimpleTexts[arc4random() % self.mSimpleTexts.count];
    [self.mRCView appendItem:rc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self mountStubs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
