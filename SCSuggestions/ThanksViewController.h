//
//  ThanksViewController.h
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/22/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Suggestion.h"

@interface ThanksViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *nameShow;
@property (weak, nonatomic) IBOutlet UILabel *topicShow;
@property (weak, nonatomic) IBOutlet UITextView *suggestionShow;
@property (nonatomic) Suggestion *suggestion;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
