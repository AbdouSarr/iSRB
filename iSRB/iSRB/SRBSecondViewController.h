//
//  SRBSecondViewController.h
//  iSRB
//
//  Created by Abdou Sarr on 2014-04-05.
//  Copyright (c) 2014 SarrApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRBSecondViewController : UIViewController {
    IBOutlet UILabel *dayOfWeek;
    IBOutlet UILabel *monthDayNum;
    IBOutlet UILabel *currentSchedule;
    NSString *currentDayOfWeek;
    NSString *displayCurrentSchedule;
}

@end
