//
//  PushNoAnimTrans.m
//  iSRB
//
//  Created by Abdou Sarr on 2014-04-30.
//  Copyright (c) 2014 SarrApps. All rights reserved.
//

#import "PushNoAnimTrans.h"

@implementation PushNoAnimTrans


-(void) perform{
    
    UIViewController *src = (UIViewController *) self.sourceViewController;
    UIViewController *dst = (UIViewController *) self.destinationViewController;
    [UIView transitionWithView:src.navigationController.view duration:0.1
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    animations:^{
                        [src.navigationController pushViewController:dst animated:NO];
                    }
                    completion:NULL];
}




@end
