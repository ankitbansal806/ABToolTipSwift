//
//  ABPopTip+Entrance.h
//  ABPopTip
//
//  Created by Andrea Mazzini on 10/06/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

#import "ABPopTip.h"

@interface ABPopTip (Entrance)

/** Perform entrance animation
 *
 * Triggers the chosen entrance animation
 *
 * @param completion Completion handler
 */
- (void)performEntranceAnimation:(void (^)())completion;

@end
