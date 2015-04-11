//
//  ATERandomViewController.m
//  ATERichContent
//
//  Created by David Martinez on 29/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERandomViewController.h"
#import "ATERCHeaders.h"

@interface ATERandomViewController ()

@property (nonatomic, weak) IBOutlet ATERCContainerView *mRCView;

@property (nonatomic, strong) NSArray *mSampleTexts;
@property (nonatomic, strong) NSArray *mSampleImages;
@property (nonatomic, strong) NSArray *mSampleWebView;
@property (nonatomic, strong) NSArray *mSampleGallery;
@property (nonatomic, strong) NSArray *mSampleVideo;

@end

@implementation ATERandomViewController

#pragma mark - -------------------- IMPLEMENTATION ---------------------
#pragma mark - ---- Services
- (void) mountStubs {
    self.mSampleTexts = @[@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum varius sem eget leo interdum, et blandit nisl tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla sit amet tristique est. Nulla scelerisque at lorem ut iaculis. Pellentesque quis arcu suscipit arcu gravida interdum sed quis urna. Ut faucibus purus non fermentum dignissim. Suspendisse eu pellentesque nisi. Aenean in enim sem.",
                          @"Nam id congue tellus. Nullam ac egestas ipsum, sit amet consectetur risus. Ut porta venenatis massa quis ultrices. Donec est neque, scelerisque ac tellus in, ornare venenatis leo. Aliquam efficitur lacinia nibh ac commodo. Ut aliquet auctor rutrum. Pellentesque ac enim ac nulla egestas sodales. In justo dui, dapibus a venenatis id, vehicula sed lorem. In at rhoncus orci. Phasellus nec leo ex. Ut nec fringilla metus. Nam a arcu feugiat, sodales est quis, facilisis tellus.",
                          @"Donec congue consequat egestas. Vestibulum vitae porttitor mi. Mauris lobortis nec risus vitae rutrum. Nullam lectus nibh, vulputate id feugiat a, consequat non lacus. Morbi eleifend arcu at malesuada dictum. Cras malesuada sagittis risus fringilla eleifend. Cras vehicula, ex eget tempus malesuada, lectus enim suscipit erat, nec rutrum metus massa ac lacus. Maecenas porta tortor a ullamcorper volutpat. Pellentesque eros sem, ullamcorper sit amet sapien ut, rutrum placerat quam. Curabitur in feugiat nisl. Sed pharetra nunc ex, quis tristique leo condimentum vel. Etiam vel volutpat nunc. Mauris dictum tristique metus at imperdiet. Nulla vel aliquet tellus. Nulla ultricies metus lorem, consequat luctus metus mattis ac. Nulla est tortor, vestibulum a accumsan in, tincidunt a eros."
                          ];
    
    self.mSampleImages = @[@"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg",
                           @"http://media4.popsugar-assets.com/files/2014/08/08/878/n/1922507/caef16ec354ca23b_thumb_temp_cover_file32304521407524949.xxxlarge/i/Funny-Cat-GIFs.jpg",
                           @"http://freedwallpaper.com/wp-content/uploads/2014/11/cat-wallpapers-for-desktop-2-1366x768-770958.jpg"];
    
    self.mSampleWebView = @[@"http://www.google.es",
                            @"http://www.twitter.com",
                            @"http://www.facebook.com"];
    
    self.mSampleGallery = @[
                            @[@"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg",
                              @"http://media4.popsugar-assets.com/files/2014/08/08/878/n/1922507/caef16ec354ca23b_thumb_temp_cover_file32304521407524949.xxxlarge/i/Funny-Cat-GIFs.jpg",
                              @"http://freedwallpaper.com/wp-content/uploads/2014/11/cat-wallpapers-for-desktop-2-1366x768-770958.jpg",
                              @"http://media4.popsugar-assets.com/files/2014/08/08/878/n/1922507/caef16ec354ca23b_thumb_temp_cover_file32304521407524949.xxxlarge/i/Funny-Cat-GIFs.jpg",
                              ],
                            @[@"http://media4.popsugar-assets.com/files/2014/08/08/878/n/1922507/caef16ec354ca23b_thumb_temp_cover_file32304521407524949.xxxlarge/i/Funny-Cat-GIFs.jpg",
                              @"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg",
                              @"http://freedwallpaper.com/wp-content/uploads/2014/11/cat-wallpapers-for-desktop-2-1366x768-770958.jpg",
                              ],
                            @[@"http://media4.popsugar-assets.com/files/2014/08/08/878/n/1922507/caef16ec354ca23b_thumb_temp_cover_file32304521407524949.xxxlarge/i/Funny-Cat-GIFs.jpg",
                              @"http://freedwallpaper.com/wp-content/uploads/2014/11/cat-wallpapers-for-desktop-2-1366x768-770958.jpg",
                              @"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg",
                              @"http://freedwallpaper.com/wp-content/uploads/2014/11/cat-wallpapers-for-desktop-2-1366x768-770958.jpg",
                              @"http://www.vetprofessionals.com/catprofessional/images/home-cat.jpg"],
                            ];
    
    self.mSampleVideo = @[@"http://techslides.com/demos/sample-videos/small.mp4"];
}

- (IBAction) actionInsertATERCItem:(id)sender {
    NSInteger numberOfViewers = 6;
    NSInteger viewer = arc4random() % numberOfViewers;
    
    ATERC *rc = nil;
    if (viewer == 0) {
        rc = [[ATERCLabel alloc] init];
        rc.mRichContentType = kATERCTypeLabel;
        rc.mRichContentHeight = kATERCWrapContentHeight;
        ((ATERCLabel *)rc).mText = self.mSampleTexts[arc4random() % self.mSampleTexts.count];
    } else if (viewer == 1) {
        rc = [[ATERCImage alloc] init];
        rc.mRichContentType = kATERCTypeImage;
        rc.mRichContentHeight = (1 + (arc4random() % 3))*50.0; // height between 50-150
        ((ATERCImage *)rc).mImageLoadBlock = ^UIImage *(NSString * imageUrl) {
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            UIImage *image = [UIImage imageWithData:data];
            return image;
        };
        
        ((ATERCImage *)rc).mImageUrl = self.mSampleImages[arc4random() % self.mSampleImages.count];
    } else if (viewer == 2) {
        rc = [[ATERCAttributtedLabel alloc] init];
        rc.mRichContentType = kATERCTypeAttributtedLabel;
        rc.mRichContentHeight = kATERCWrapContentHeight;
        
        NSString *text = self.mSampleTexts[arc4random() % self.mSampleTexts.count];
        NSMutableAttributedString *aText = [[NSMutableAttributedString alloc] initWithString:text];
        UIColor *color = [UIColor colorWithRed:(arc4random()%256)/255.0
                                         green:(arc4random()%256)/255.0
                                          blue:(arc4random()%256)/255.0
                                         alpha:1];
        NSInteger interval = text.length/3;
        [aText addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, interval)];
        color = [UIColor colorWithRed:(arc4random()%256)/255.0
                                green:(arc4random()%256)/255.0
                                 blue:(arc4random()%256)/255.0
                                alpha:1];
        [aText addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(interval, interval)];
        color = [UIColor colorWithRed:(arc4random()%256)/255.0
                                green:(arc4random()%256)/255.0
                                 blue:(arc4random()%256)/255.0
                                alpha:1];
        [aText addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(2*interval, interval)];
        
        ((ATERCAttributtedLabel *) rc).mAttributedText = aText;
    } else if (viewer == 3) {
        rc = [[ATERCWeb alloc] init];
        rc.mRichContentType = kATERCTypeWebview;
        rc.mRichContentHeight = 150;
        ((ATERCWeb *) rc).mWebUrl = self.mSampleWebView[arc4random() % self.mSampleWebView.count];
    } else if (viewer == 4) {
        rc = [[ATERCGallery alloc] init];
        rc.mRichContentType = kATERCTypePhotoGallery;
        rc.mRichContentHeight = 150;
        ((ATERCGallery *)rc).mImagesUrl = self.mSampleGallery[arc4random() % self.mSampleGallery.count];
    } else if (viewer == 5) {
        rc = [[ATERCVideo alloc] init];
        rc.mRichContentType = kATERCTypeVideo;
        rc.mRichContentHeight = 150.0;
        ((ATERCVideo *)rc).mVideoUrl = self.mSampleVideo[arc4random() % self.mSampleVideo.count];
    }
    
    [self.mRCView appendItem:rc];
}

- (IBAction) actionClean:(id)sender {
    [self.mRCView clean];
}

#pragma mark - -------------------- OVERRIDES ---------------------
#pragma mark - -------------------- DELEGATES ---------------------
#pragma mark - -------------------- LIFECICLE ---------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    [self mountStubs];
    [[ATERCManager getInstance] restoreComponentsToDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
