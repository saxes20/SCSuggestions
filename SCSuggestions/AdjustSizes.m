//
//  AdjustSizes.m
//  SCSuggestions
//
//  Created by Saxena, Sameer on 8/18/15.
//  Copyright (c) 2015 Saxena, Sameer. All rights reserved.
//

#import "AdjustSizes.h"

@implementation AdjustSizes

-(instancetype) initWithScreen: (CGRect) screenBounds screenSize: (CGSize) screenSize screenHeight: (CGFloat) screenHeight screenWidth: (CGFloat) screenWidth integerHeight: (int) integerHeight integerWidth: (int) integerWidth {
    
    self = [super init];
    
    if(self) {
        _screenBounds = screenBounds;
        _screenSize = screenSize;
        _screenHeight = screenHeight;
        _screenWidth = screenWidth;
        _integerHeight = integerHeight;
        _integerWidth = integerWidth;
    }
    
    return self;
}

- (void)suggestionTBView:(UILabel *)label1 label2:(UILabel *)label2 view:(UIView *)view {
    _screenBounds = [[UIScreen mainScreen] bounds];
    _screenSize = _screenBounds.size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    _integerWidth = (int) roundf(_screenWidth);
    _integerHeight = (int) roundf(_screenHeight);
    
    if (_integerWidth == 375) {
        //iphone 6
        label1.frame = CGRectMake(1, 8, label1.frame.size.width, label1.frame.size.height);
        label2.frame = CGRectMake(34, 25, label2.frame.size.width, label2.frame.size.height);
        view.frame = CGRectMake(0, 0, 376, view.frame.size.height);
    }
    else if (_integerWidth == 414) {
        //iphone 6P
        label1.frame = CGRectMake(20, 8, label1.frame.size.width, label1.frame.size.height);
        label2.frame = CGRectMake(53, 25, label2.frame.size.width, label2.frame.size.height);
        view.frame = CGRectMake(0, 0, 414, view.frame.size.height);
    } else {
        label1.frame = CGRectMake(-27, 8, label1.frame.size.width, label1.frame.size.height);
        label2.frame = CGRectMake(8, 25, label2.frame.size.width, label2.frame.size.height);
        view.frame = CGRectMake(0, 0, 320, view.frame.size.height);
    }
}




@end
