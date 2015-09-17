//
//  ABPopTip+Entrance.m
//  ABPopTip
//
//  Created by Andrea Mazzini on 10/06/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

#import "ABPopTip+Entrance.h"

@implementation ABPopTip (Entrance)

- (void)performEntranceAnimation:(void (^)())completion {
    switch (self.entranceAnimation) {
        case ABPopTipEntranceAnimationScale: {
            [self entranceScale:completion];
            break;
        }
        case ABPopTipEntranceAnimationTransition: {
            [self entranceTransition:completion];
            break;
        }
        case ABPopTipEntranceAnimationCustom: {
            [self.containerView addSubview:self];
            if (self.entranceAnimationHandler) {
                self.entranceAnimationHandler(^{
                    completion();
                });
            }
        }
        case ABPopTipEntranceAnimationNone: {
            [self.containerView addSubview:self];
            completion();
            break;
        }
        default: {
            [self.containerView addSubview:self];
            completion();
            break;
        }
    }
}

- (void)entranceTransition:(void (^)())completion {
    self.transform = CGAffineTransformMakeScale(0.6, 0.6);
    switch (self.direction) {
        case ABPopTipDirectionUp:
            self.transform = CGAffineTransformTranslate(self.transform, 0, -self.fromFrame.origin.y);
            break;
        case ABPopTipDirectionDown:
            self.transform = CGAffineTransformTranslate(self.transform, 0, (self.containerView.frame.size.height - self.fromFrame.origin.y));
            break;
        case ABPopTipDirectionLeft:
            self.transform = CGAffineTransformTranslate(self.transform, -self.fromFrame.origin.x, 0);
            break;
        case ABPopTipDirectionRight:
            self.transform = CGAffineTransformTranslate(self.transform, (self.containerView.frame.size.width - self.fromFrame.origin.x), 0);
            break;
        case ABPopTipDirectionNone:
            self.transform = CGAffineTransformTranslate(self.transform, 0, (self.containerView.frame.size.height - self.fromFrame.origin.y));
            break;

        default:
            break;
    }
    [self.containerView addSubview:self];

    [UIView animateWithDuration:self.animationIn delay:self.delayIn usingSpringWithDamping:0.6 initialSpringVelocity:1.5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL completed){
        if (completed) {
            completion();
        }
    }];
}

- (void)entranceScale:(void (^)())completion {
    self.transform = CGAffineTransformMakeScale(0, 0);
    [self.containerView addSubview:self];

    [UIView animateWithDuration:self.animationIn delay:self.delayIn usingSpringWithDamping:0.6 initialSpringVelocity:1.5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL completed){
        if (completed) {
            completion();
        }
    }];
}

@end
