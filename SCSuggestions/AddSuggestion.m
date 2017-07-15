//
//  AddSuggestion.m
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import "AddSuggestion.h"
#import <Parse/Parse.h>

NSString *const nameData = @"nameDatabase";
NSString *const topicData = @"topicDatabase";
NSString *const suggestionData = @"suggestionDatabase";
@interface AddSuggestion ()

@end

NSString *topicString;
BOOL iPressed;
@implementation AddSuggestion

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.popover.hidden = YES;
    self.pressFood.hidden = YES;
    self.pressTransportation.hidden = YES;
    self.pressSports.hidden = YES;
    self.pressEvents.hidden=  YES;
    self.pressClassroom.hidden  = YES;
    self.pressOther.hidden = YES;
    self.errorMessage.hidden = YES;
    iPressed = NO;
    
//    _nameTextView.delegate = self;
//    _suggestionTextView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)topic:(id)sender {
    self.popover.hidden = NO;
    self.pressFood.hidden = NO;
    self.pressTransportation.hidden = NO;
    self.pressSports.hidden = NO;
    self.pressEvents.hidden=  NO;
    self.pressClassroom.hidden  = NO;
    self.pressOther.hidden = NO;
}

#pragma mark - Table view delegate


- (IBAction)save:(id)sender {
    if(_nameTextView.text.length == 0 || _suggestionTextView.text.length == 0) {
        self.errorMessage.hidden = NO;
    }
    else {
    PFObject *suggestion = [PFObject objectWithClassName:@"Suggestion"];
    [suggestion setObject:_nameTextView.text forKey:@"name"];
    [suggestion setObject:_suggestionTextView.text forKey:@"suggestion"];
    [suggestion setObject:_topicText.currentTitle forKey:@"topic"];
    [suggestion setObject:@"B" forKey:@"review"];
        //[suggestion setObject:NO forKey:@"iLiked"];
    [suggestion saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(error) {
            NSLog(@"There was an error: %@", error);
        }
        else {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTableView" object:self];
            //self.view1.hidden= YES;
        }
        
    }];
        
        self.errorMessage.hidden = YES;
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidUnload {
    self.nameTextView.text = @"";
    self.suggestionTextView.text = @"";
    self.errorMessage.hidden = YES;
    [super viewDidUnload];
}


#pragma mark - Textfield delegate

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view]endEditing:YES];
}


- (IBAction)food:(id)sender {
    [self.topicText setTitle:@"Food" forState:UIControlStateNormal];
    self.popover.hidden = YES;
    self.pressFood.hidden = YES;
    self.pressTransportation.hidden = YES;
    self.pressSports.hidden = YES;
    self.pressEvents.hidden=  YES;
    self.pressClassroom.hidden  = YES;
    self.pressOther.hidden = YES;
    topicString = @"Food";
    iPressed = YES;
}

- (IBAction)transportation:(id)sender {
    [self.topicText setTitle:@"Transportation" forState:UIControlStateNormal];
    self.popover.hidden = YES;
    self.pressFood.hidden = YES;
    self.pressTransportation.hidden = YES;
    self.pressSports.hidden = YES;
    self.pressEvents.hidden=  YES;
    self.pressClassroom.hidden  = YES;
    self.pressOther.hidden = YES;
    topicString = @"Transportation";
    iPressed = YES;
}

- (IBAction)sports:(id)sender {
    [self.topicText setTitle:@"Sports" forState:UIControlStateNormal];
    self.popover.hidden = YES;
    self.pressFood.hidden = YES;
    self.pressTransportation.hidden = YES;
    self.pressSports.hidden = YES;
    self.pressEvents.hidden=  YES;
    self.pressClassroom.hidden  = YES;
    self.pressOther.hidden = YES;
    topicString = @"Sports";
    iPressed = YES;
}

- (IBAction)events:(id)sender {
    [self.topicText setTitle:@"Events" forState:UIControlStateNormal];
    self.popover.hidden = YES;
    self.pressFood.hidden = YES;
    self.pressTransportation.hidden = YES;
    self.pressSports.hidden = YES;
    self.pressEvents.hidden=  YES;
    self.pressClassroom.hidden  = YES;
    self.pressOther.hidden = YES;
    topicString = @"Events";
    iPressed = YES;
}

- (IBAction)classroom:(id)sender {
    [self.topicText setTitle:@"Classroom" forState:UIControlStateNormal];
    self.popover.hidden = YES;
    self.pressFood.hidden = YES;
    self.pressTransportation.hidden = YES;
    self.pressSports.hidden = YES;
    self.pressEvents.hidden=  YES;
    self.pressClassroom.hidden  = YES;
    self.pressOther.hidden = YES;
    topicString = @"Classroom";
    iPressed = YES;
}


- (IBAction)other:(id)sender {
    [self.topicText setTitle:@"Other" forState:UIControlStateNormal];
    self.popover.hidden = YES;
    self.pressFood.hidden = YES;
    self.pressTransportation.hidden = YES;
    self.pressSports.hidden = YES;
    self.pressEvents.hidden=  YES;
    self.pressClassroom.hidden  = YES;
    self.pressOther.hidden = YES;
    topicString = @"Other";
    iPressed = YES;
}

- (IBAction)tap:(id)sender {
    [[self view] endEditing:YES];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if(_nameTextView.text.length == 0 || _suggestionTextView.text.length == 0) {
        self.errorMessage.hidden = NO;
        return NO;
    }
    else {
        PFObject *suggestion = [PFObject objectWithClassName:@"Suggestion"];
        [suggestion setObject:_nameTextView.text forKey:@"name"];
        [suggestion setObject:_suggestionTextView.text forKey:@"suggestion"];
        [suggestion setObject:_topicText.currentTitle forKey:@"topic"];
        [suggestion setObject:@"B" forKey:@"review"];
        //[suggestion setObject:NO forKey:@"iLiked"];
        [suggestion saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if(error) {
                NSLog(@"There was an error: %@", error);
            }
            else {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTableView" object:self];
                
            }
            
        }];
        
        if(!iPressed) {
            topicString = @"Other";
        }
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSString *saveName = self.nameTextView.text;
        [userDefaults setObject:saveName forKey:nameData];
        NSString *saveSuggestion = self.suggestionTextView.text;
        [userDefaults setObject:saveSuggestion forKey:suggestionData];
        [userDefaults setObject:topicString forKey:topicData];
        [userDefaults synchronize];
      return YES;
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
