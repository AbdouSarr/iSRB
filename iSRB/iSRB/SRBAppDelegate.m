//
//  SRBAppDelegate.m
//  iSRB
//
//  Created by Abdou Sarr on 2014-04-05.
//  Copyright (c) 2014 SarrApps. All rights reserved.
//

#import "SRBAppDelegate.h"
#import <Parse/Parse.h>

@implementation SRBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [Parse setApplicationId:@"T9Sf5EUAUDEFIi1KyP9ZpIhbKwzOqoMC2tRlvpSD"
                  clientKey:@"lhbD8K9iY5PBLuskcwmdSS0mnI5lH04qTEko5tux"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    // Register for push notifications
    [application registerForRemoteNotificationTypes:
     UIRemoteNotificationTypeBadge |
     UIRemoteNotificationTypeAlert |
     UIRemoteNotificationTypeSound];
    
    [self checkScreen];
    
    [self changeSlide];
    [self slideTimer];
    
    
    return YES;
}


- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:newDeviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
}


-(void)changeSlide {
    
    slide++;
    
    if(slide > 8)//an array count perhaps
        slide = 1;
    //create the string as needed
    NSString *theName = [NSString stringWithFormat:@"img_%d.png", slide];
    UIImage *toImage = [UIImage imageNamed:theName];
    [UIView transitionWithView:self.window
                      duration:.7f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.window.backgroundColor = [UIColor colorWithPatternImage:toImage];
                    } completion:NULL];
    
    
}

-(void)slideTimer {
    
    timer = [NSTimer scheduledTimerWithTimeInterval:6.0f
                                             target:self
                                           selector:@selector(changeSlide)
                                           userInfo:nil
                                            repeats:YES];
}

-(void) checkScreen {
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            NSLog(@"Bad iPhone");
            UIStoryboard *iPhone4Storyboard = [UIStoryboard storyboardWithName:@"iPhone4Storyboard" bundle:nil];
            UIViewController *vc = [iPhone4Storyboard instantiateViewControllerWithIdentifier:@"sevenyolo"];
            self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            self.window.rootViewController = vc;
            [self.window makeKeyAndVisible];
            UITabBarController *tabBar = (UITabBarController *)self.window.rootViewController;
            tabBar.selectedIndex = 1;
        }
        if(result.height == 568)
        {
            NSLog(@"Good iPhone");
            UITabBarController *tabBar = (UITabBarController *)self.window.rootViewController;
            tabBar.selectedIndex = 1;
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [timer invalidate];
}

@end
