//
//  ATERichContentComponentView.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATERichContentComponentView : UICollectionViewCell

+ (CGFloat) getWrapContentHeight;

- (void) showContent:(NSObject *) content;

@end
