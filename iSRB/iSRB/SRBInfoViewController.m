//
//  SRBInfoViewController.m
//  iSRB
//
//  Created by Abdou Sarr on 2014-04-30.
//  Copyright (c) 2014 SarrApps. All rights reserved.
//

#import "SRBInfoViewController.h"

@interface SRBInfoViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SRBInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    // Do any additional setup after loading the view.
}
- (IBAction)buttonKhan:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.khanacademy.org/"]];
}
- (IBAction)buttonTunesU:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.apple.com/apps/itunes-u/"]];
}
- (IBAction)buttonHomework:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://homeworkhelp.ilc.org/"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
