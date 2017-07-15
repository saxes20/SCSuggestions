//
//  AdjustSizes.h
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/15.
//  Copyright (c) 2015 Saxena, Sameer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdjustSizes : NSObject

@property (nonatomic) CGRect screenBounds;
@property (nonatomic) CGSize screenSize;
@property (nonatomic) CGFloat screenHeight;
@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) int integerHeight;
@property (nonatomic) int integerWidth;


//calendarTBView was able to use autoresizing
- (void) suggestionTBView: (UILabel *) label1 label2: (UILabel *) label2 view: (UIView *) view;

-(instancetype) initWithScreen: (CGRect) screenBounds screenSize: (CGSize) screenSize screenHeight: (CGFloat) screenHeight screenWidth: (CGFloat) screenWidth integerHeight: (int) integerHeight integerWidth: (int) integerWidth;

@end
