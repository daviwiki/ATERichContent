//
//  ATERCVideoView.h
//  ATERichContent
//
//  Created by David Martinez on 22/3/15.
//  Copyright (c) 2015 Atenea. All rights reserved.
//

#import "ATERCView.h"

/**
 * @interface ATERCVideoView
 * @brief View that deploy a cell with a video player
 * inside.
 * @note The video player used conforms "MPMoviePlayerController"
 * class. In iOs only a MPMoviePlayerController class must be
 * instanciate in the view tree at the same time. If you use
 * another instance, the last ones could not work. Keep in mind
 * if you want to use this cell.
 */
@interface ATERCVideoView : ATERCView

@end
