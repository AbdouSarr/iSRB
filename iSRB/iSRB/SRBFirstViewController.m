//
//  SRBFirstViewController.m
//  iSRB
//
//  Created by Abdou Sarr on 2014-04-05.
//  Copyright (c) 2014 SarrApps. All rights reserved.
//

#import "SRBFirstViewController.h"
#import "STTwitter.h"

@interface SRBFirstViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *twitterFeed;
@end

@implementation SRBFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
	
    STTwitterAPI *twitter = [STTwitterAPI twitterAPIAppOnlyWithConsumerKey:@"f6hsbN5YvubQj61cLNsjjqsAK" consumerSecret:@"vQI14R3evORdgRzUIPLOPCKdH1PV86TBfDorxsLrDk4qwMFBcU"];
    
    [twitter verifyCredentialsWithSuccessBlock:^(NSString *username) {
        
        [twitter getUserTimelineWithScreenName:@"SRB_news" successBlock:^(NSArray *statuses) {
            
            self.twitterFeed = [NSMutableArray arrayWithArray:statuses];
            
            [self.tableView reloadData];
            
        } errorBlock:^(NSError *error) {
            
            NSLog(@"%@",error.description);
            
        }];
        
    } errorBlock:^(NSError *error) {
        
        NSLog(@"%@",error.debugDescription);
        
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.twitterFeed.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID =  @"CellID" ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSInteger idx = indexPath.row;
    NSDictionary *t = self.twitterFeed[idx];
    
    cell.textLabel.text = t[@"text"];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
