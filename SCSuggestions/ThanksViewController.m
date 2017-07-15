//
//  ThanksViewController.m
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/22/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import "ThanksViewController.h"
//NSString *const nameData = @"nameDatabase";
//NSString *const topicData = @"topicDatabase";
//NSString *const suggestionData = @"suggestionDatabase";

@interface ThanksViewController ()

@end

@implementation ThanksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *userDefaults2 = [NSUserDefaults standardUserDefaults];
    self.nameShow.text = [userDefaults2 objectForKey:@"nameDatabase"];
    self.topicShow.text = [userDefaults2 objectForKey:@"topicDatabase"];
    self.suggestionShow.text = [userDefaults2 objectForKey:@"suggestionDatabase"];
    self.nameShow.editable = NO;
    self.suggestionShow.editable = NO;
    [_scrollView setScrollEnabled:YES];
    [_scrollView setContentSize:CGSizeMake(320, 568)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToSuggestions:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
