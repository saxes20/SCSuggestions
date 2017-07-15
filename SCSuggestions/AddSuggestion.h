//
//  AddSuggestion.h
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSuggestion : UITableViewController
@property (weak, nonatomic) IBOutlet UIImageView *popover;
@property (weak, nonatomic) IBOutlet UIButton *pressFood;
@property (weak, nonatomic) IBOutlet UIButton *pressTransportation;
@property (weak, nonatomic) IBOutlet UIButton *pressSports;
@property (weak, nonatomic) IBOutlet UIButton *pressEvents;
@property (weak, nonatomic) IBOutlet UIButton *pressClassroom;
@property (weak, nonatomic) IBOutlet UIButton *pressOther;

@property (weak, nonatomic) IBOutlet UITextView *nameTextView;
@property (weak, nonatomic) IBOutlet UITextView *suggestionTextView;
@property (weak, nonatomic) IBOutlet UIButton *topicText;

@property (weak, nonatomic) IBOutlet UILabel *errorMessage;

@property (weak, nonatomic) IBOutlet UIView *view1;
@end
