//
//  CalenderDetailVC.h
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import "ViewController.h"
#import "Calender.h"

@interface CalenderDetailVC : ViewController
@property (weak, nonatomic) IBOutlet UILabel *eventLabel;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *upcomingLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysLeftLabel;
@property (nonatomic) Calender *calender;

@end
