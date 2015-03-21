//
//  ATEImageView.h
//  ATERichContent
//
//  Created by David Martinez on 21/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATEImageView : UIImageView

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *mActivityIndicator;

- (void) showContent:(NSString *) imageUrl;

@end
