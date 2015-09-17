//
//  ABPopTip+Animation.h
//  ABPopTip
//
//  Created by Andrea Mazzini on 10/06/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

#import "ABPopTip.h"

@interface ABPopTip (Animation)

/** Start the popover action animation
 *
 * Starts the popover action animation. Does nothing if the popover wasn't animating in the first place.
 */
- (void)performActionAnimation;

/** Stops the popover action animation
 *
 * Stops the popover action animation. Does nothing if the popover wasn't animating in the first place.
 */
- (void)dismissActionAnimation;

@end
