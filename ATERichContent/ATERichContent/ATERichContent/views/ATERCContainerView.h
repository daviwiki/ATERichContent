//
//  ATERCContainerView.h
//  ATERichContent
//
//  Created by David Martinez on 2/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ATERC;

/**
 * @class 
 * ATERichContentView
 * @note Required frameworks
 *      <Foundation/Foundation.h>
 *      <UIKit/UIKit.h>
 */
@interface ATERCContainerView : UIView

/**
 * @function
 * appendItem:
 * @brief Include a new rich content item into the view (into last position)
 */
- (void) appendItem:(ATERC *) content;

/**
 * @function
 * appendItem:atIndex:
 * @brief Include a new rich content item into the index
 * given by 'index' param
 */
- (void) appendItem:(ATERC *)content atIndex:(NSUInteger) index;

/**
 * @function
 * clean
 * @brief Clean all components of the view
 */
- (void) clean;

/**
 * @function
 * showContent:
 * @brief Display the list of contents given (if any). This method
 * clean all contents loaded previously
 * @param contents, array of "ATERC" (or subclass) items
 */
- (void) showContent:(NSArray *) contents;

@end
