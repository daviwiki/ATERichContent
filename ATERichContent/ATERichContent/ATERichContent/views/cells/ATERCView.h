//
//  ATERCView.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ATERC, ATERCComponent;

@interface ATERCView : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIView *mBackgroundView;

/**
 * @function getHeightForContent:andComponent:
 * @brief <p>Returnt the contents height 
 * for the content given</p>
 * @note <p>If something goes wrong, return 0</p>
 * @note <p>Must be override by subclasses to define the
 * the height for the content</p>
 * @param content, not null
 */
+ (NSNumber *) getHeightForContent:(ATERC *) content;

/**
 * @function validateContent:
 * @brief
 * <p>Define if 'content' is a valid instance for
 * this ATERCView instance</p>
 */
- (BOOL) validateContent:(ATERC *) content;

/**
 * @function showContent:
 * @brief
 * <p>Display the content given</p>
 */
- (void) showContent:(ATERC *) content;

@end
