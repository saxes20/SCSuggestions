//
//  Detail.m
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import "Detail.h"

@interface Detail ()

@end

int likes;


@implementation Detail

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
    int randomPick = arc4random_uniform(5);
    self.otherImage.hidden  = YES;
    UIImage *img;
    NSLog(@"randomPick is equal to %d", randomPick);
    if(randomPick == 1) {
        img = [UIImage imageNamed:@"ealogo.png"];
        [_otherImage setImage:img];
        self.otherImage.hidden = NO;
        self.nameLabel.textColor = [UIColor blueColor];
        
    }
    else if(randomPick == 2) {
        img = [UIImage imageNamed:@"EABackground1.jpg"];
        [_imageBackground setImage:img];
        self.nameLabel.textColor = [UIColor whiteColor];
    
    }
    else if(randomPick == 3) {
        img = [UIImage imageNamed:@"EABackground2.JPG"];
        [_imageBackground setImage:img];
        self.nameLabel.textColor = [UIColor whiteColor];
    }
    else if(randomPick == 4) {
        img = [UIImage imageNamed:@"EABackground3.jpg"];
        [_imageBackground setImage:img];
        self.nameLabel.textColor = [UIColor whiteColor];
        
    }
    else {
        img = [UIImage imageNamed:@"chapelBackground.png"];
        [_imageBackground setImage:img];
        self.nameLabel.textColor = [UIColor whiteColor];
    }
    
    
    self.suggestionView.editable = NO;
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.nameLabel.text = self.suggestion.name;
    self.topicLabel.text = self.suggestion.topic;
    self.suggestionView.text = self.suggestion.suggestion;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
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
