//
//  Detail.h
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import "ViewController.h"
#import "Suggestion.h"

@interface Detail : ViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *topicLabel;

@property (weak, nonatomic) IBOutlet UITextView *suggestionView;

@property (nonatomic) Suggestion *suggestion;

@property (weak, nonatomic) IBOutlet UIImageView *imageBackground;

@property (weak, nonatomic) IBOutlet UIImageView *otherImage;



@end
