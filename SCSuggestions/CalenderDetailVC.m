//
//  CalenderDetailVC.m
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import "CalenderDetailVC.h"
#import "Suggestion.h"

@interface CalenderDetailVC ()

@end

@implementation CalenderDetailVC

NSInteger calendarDateInt;
BOOL eventPassed;

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
    self.textView.editable = NO;
    self.daysLeftLabel.hidden = YES;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.eventLabel.text = self.calender.event;
    self.monthLabel.text = self.calender.month;
    self.dateLabel.text = self.calender.date;
    self.textView.text = self.calender.eventDetails;
    
    NSLog(@"Upcoming: %@", self.calender.upcoming);
    
    NSString *dayLeftStr;
    
    if([monthSelect() isEqualToString:self.calender.month]) {
        self.daysLeftLabel.hidden = NO;
        
        calendarDateInt = [self.calender.date integerValue];
        NSLog(@"The date of the event is %ld", (long)calendarDateInt);
    
        if (dateSubtraction() > 0) {
            dayLeftStr = [NSString stringWithFormat:@"%ld Days Left", (long)dateSubtraction()];
            [self.daysLeftLabel setText:dayLeftStr];
        }
        else if(dateSubtraction() < 0) {
            dayLeftStr = [NSString stringWithFormat:@"Event Passed"];
            [self.daysLeftLabel setText:dayLeftStr];
            eventPassed = YES;
        }
    }
    
    if([self.calender.upcoming isEqualToString:@"YES"]) {
        if(eventPassed) {
            self.upcomingLabel.hidden = YES;
        } else {
            self.upcomingLabel.hidden = NO;
            NSLog(@"Upcoming is YES");
        }
    }else {
        self.upcomingLabel.hidden = YES;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


NSInteger dateSubtraction() {
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    
    NSLog(@"The day is %ld", (long)[components day]);
    

    NSInteger subtract = calendarDateInt - [components day];
    
    return subtract;
}

NSString* monthSelect() {
    NSString *month = @"January";
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate];
    
    switch ([components month]) {
        case 2:
            month = @"February";
            break;
        case 3:
            month = @"March";
            break;
        case 4:
            month = @"April";
            break;
        case 5:
            month = @"May";
            break;
        case 6:
            month = @"June";
            break;
        case 7:
            month = @"July";
            break;
        case 8:
            month = @"August";
            break;
        case 9:
            month = @"September";
            break;
        case 10:
            month = @"October";
            break;
        case 11:
            month = @"November";
            break;
        case 12:
            month = @"December";
            break;
        default:
            month = @"January";
            break;
    }
    
    return month;
}



- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
