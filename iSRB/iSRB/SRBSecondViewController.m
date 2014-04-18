//
//  SRBSecondViewController.m
//  iSRB
//
//  Created by Abdou Sarr on 2014-04-05.
//  Copyright (c) 2014 SarrApps. All rights reserved.
//

#import "SRBSecondViewController.h"

@interface SRBSecondViewController ()

@end

@implementation SRBSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor clearColor];

    
    // Set vertical effect
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.y"
     type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-10);
    verticalMotionEffect.maximumRelativeValue = @(10);
    
    // Set horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-10);
    horizontalMotionEffect.maximumRelativeValue = @(10);
    
    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    // Add both effects to your view
    [self.view addMotionEffect:group];
    
    [self loadDates];
    
}

-(void)loadDates {
    
    NSDateFormatter *FormattedDayOfWeek = [[NSDateFormatter alloc]init];
    [FormattedDayOfWeek setDateFormat:@"cccc"];
    currentDayOfWeek = [FormattedDayOfWeek stringFromDate:[NSDate date]];
    dayOfWeek.text = currentDayOfWeek;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *prefixDateFormatter = [[NSDateFormatter alloc] init];
    [prefixDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [prefixDateFormatter setDateFormat:@"MMMM d"];
    NSString *prefixDateString = [prefixDateFormatter stringFromDate:date];
    NSDateFormatter *monthDayFormatter = [[NSDateFormatter alloc] init];
    [monthDayFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [monthDayFormatter setDateFormat:@"d"];
    int date_day = [[monthDayFormatter stringFromDate:date] intValue];
    NSString *suffix_string = @"|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st";
    NSArray *suffixes = [suffix_string componentsSeparatedByString: @"|"];
    NSString *suffix = [suffixes objectAtIndex:date_day];
    NSString *dateString = [prefixDateString stringByAppendingString:suffix];
    monthDayNum.text = dateString;
    
    NSDateFormatter *FormattedCurrentSchedule = [[NSDateFormatter alloc]init];
    [FormattedCurrentSchedule setDateFormat:@"d"];
    displayCurrentSchedule = [FormattedCurrentSchedule stringFromDate:[NSDate date]];
    
    int scheduleNumber = [displayCurrentSchedule intValue];
    
    if ((scheduleNumber/2) * 2 == scheduleNumber) {
        
        currentSchedule.text = @"Day 2";
    }else{
        currentSchedule.text = @"Day 1";
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
