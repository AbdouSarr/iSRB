//
//  SRBAppDelegate.h
//  iSRB
//
//  Created by Abdou Sarr on 2014-04-05.
//  Copyright (c) 2014 SarrApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRBAppDelegate : UIResponder <UIApplicationDelegate> {
    
    int slide;
    NSTimer *timer;
}

@property (strong, nonatomic) UIWindow *window;

@end
