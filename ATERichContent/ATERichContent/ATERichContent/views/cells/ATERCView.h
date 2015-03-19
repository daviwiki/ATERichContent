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
 * @function
 * getHeightForContent:andComponent:
 * @brief <p>Returnt the contents height 
 * for this content and compontent</p>
 * @note <p>If something goes wrong, return 0</p>
 * @param content, not null
 * @param component, not null
 */
+ (NSNumber *) getHeightForContent:(ATERC *) content
                      andComponent:(ATERCComponent *) compontent;

/**
 * @function
 * validateContent:
 * @brief
 * <p></p>
 */
- (BOOL) validateContent:(ATERC *) content;

/**
 * @function
 * showContent:
 * @brief
 * <p></p>
 */
- (void) showContent:(ATERC *) content;

@end
