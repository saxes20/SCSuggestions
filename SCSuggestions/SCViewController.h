//
//  SCViewController.h
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import <Parse/Parse.h>
#import "Suggestion.h"

@interface SCViewController : PFQueryTableViewController
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;



@end
