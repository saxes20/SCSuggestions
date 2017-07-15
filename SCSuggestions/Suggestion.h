//
//  Suggestion.h
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/14.
//  Copyright (c) 2014 Saxena, Sameer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Suggestion : NSObject
//Must be same as the class in Parse
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *suggestion;
@property (nonatomic) NSString *topic;
@property (nonatomic) NSString *review;

@end
