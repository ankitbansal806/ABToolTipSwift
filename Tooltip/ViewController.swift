//
//  ViewController.swift
//  Tooltip
//
//  Created by RachitBagda on 28/08/15.
//  Copyright (c) 2015 fullestop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var TooltipBtn : UIButton!
    var poptip : ABPopTip!
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.translucent = false
        
        ABPopTip.appearance().font = UIFont(name: "Avenir-Medium", size: 15)
        poptip = ABPopTip()
        poptip.shouldDismissOnTap = true
        poptip.edgeMargin = 5
        poptip.offset = 2
        poptip.edgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
        
        TooltipBtn = UIButton()
        TooltipBtn.frame = CGRectMake(screenWidth/2-15,screenHeight/2,30,30)
        TooltipBtn.setTitle("[?]", forState: UIControlState.Normal)
        TooltipBtn.backgroundColor = UIColor.redColor()
        TooltipBtn.showsTouchWhenHighlighted = true
        TooltipBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        TooltipBtn.titleLabel!.font = UIFont(name: "Avenir-Medium", size: 15)
        TooltipBtn.tag = 1
        TooltipBtn.addTarget(self, action: "tooltipBtnClkd:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(TooltipBtn)
        
//        poptip.tapHandler = {
//            self.TooltipBtn.tag = 2
//            print("show")
//        }
//        poptip.dismissHandler = {
//            self.TooltipBtn.tag = 1
//             print("dismiss")
//        }
    }
    
    func tooltipBtnClkd(sender:UIButton!) {
       print(TooltipBtn.tag)
        switch(true){
        case (TooltipBtn.tag == 1):
            print("up")
            TooltipBtn.tag = 2
            type(ABPopTipDirection.Up)
            break;
        case (TooltipBtn.tag == 2):
            print("dismiss")
            TooltipBtn.tag = 3
            poptip.hide()
            break;
        case (TooltipBtn.tag == 3):
            print("down")
            TooltipBtn.tag = 4
            type(ABPopTipDirection.Down)
            break;
        case (TooltipBtn.tag == 4):
            print("dismiss")
            TooltipBtn.tag = 5
            poptip.hide()
            break;
        case (TooltipBtn.tag == 5):
            print("right")
            TooltipBtn.tag = 6
            type(ABPopTipDirection.Right)
            break;
        case (TooltipBtn.tag == 6):
            print("dismiss")
            TooltipBtn.tag = 7
            poptip.hide()
            break;
        case (TooltipBtn.tag == 7):
            print("left")
            TooltipBtn.tag = 8
            type(ABPopTipDirection.Left)
            break;
        case (TooltipBtn.tag == 8):
            
             print("dismiss")
            TooltipBtn.tag = 1
            poptip.hide()
            default:
            break;
        }

        
        
//        if TooltipBtn.tag == 1 {
//            TooltipBtn.tag = 2
//            print("Show!")
//            self.poptip.popoverColor = UIColor.redColor()
        
            
            
            
            //self.poptip.actionAnimation = ABPopTipActionAnimation.Pulse
            //self.poptip.entranceAnimation = ABPopTipEntranceAnimation.Transition
            
            //ABPopTipActionAnimationBounce,
            //ABPopTipActionAnimationFloat,
            //ABPopTipActionAnimationPulse,
            //ABPopTipActionAnimationNone
            
            
            /*  Custom entrance animation  */
            //    self.popTip.entranceAnimation = ABPopTipEntranceAnimationCustom;
            //    __weak AMViewController *weakSelf = self;
            //    self.popTip.entranceAnimationHandler = ^(void (^completion)(void)){
            //        // Setup the animation
            //        weakSelf.popTip.transform = CGAffineTransformMakeRotation(M_PI);
            //        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1.5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
            //            weakSelf.popTip.transform = CGAffineTransformIdentity;
            //        } completion:^(BOOL done){
            //            completion();
            //        }];
            //    };
            
            /*  Entrance animation  */
            //    self.popTip.entranceAnimation = ABPopTipEntranceAnimationTransition;
            
            
            /*  Custom action animation  */
            //    self.popTip.actionAnimation = ABPopTipActionAnimationBounce;
            
          
            
            
//            self.poptip.showText("Animated popover, great for subtle UI tips and onboarding.Animated popover, great for subtle UI tips and onboarding",direction: ABPopTipDirection.Left,maxWidth: 200, inView: self.view, fromFrame:sender.frame, duration:10) }
//        else {
//            TooltipBtn.tag = 1
//            poptip.hide()
//            
//            print("Dismiss!")
//        }
        
    }
    func type(TYPE:ABPopTipDirection){
        
        self.poptip.showText("Animated popover, great for subtle UI tips and onboarding.Animated popover, great for subtle UI tips and onboarding",direction:TYPE ,maxWidth: 200, inView: self.view, fromFrame:TooltipBtn.frame, duration:10)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
