//
//  ABPopTip+Draw.h
//  ABPopTip
//
//  Created by Andrea Mazzini on 10/06/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

#import "ABPopTip.h"

@interface ABPopTip (Draw)

/** Poptip's Bezier path
 *
 * Returns the path used to draw the poptip, used internally by the poptip.
 *
 * @param rect The rect holding the poptip
 * @param direction The direction of the poptip appearance
 * @return UIBezierPath The poptip's path
 */
- (UIBezierPath *)pathWithRect:(CGRect)rect direction:(ABPopTipDirection)direction;

@end
