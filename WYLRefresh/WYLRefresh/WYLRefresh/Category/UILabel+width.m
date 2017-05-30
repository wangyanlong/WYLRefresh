//
//  UILabel+width.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/30.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "UILabel+width.h"

@implementation UILabel (width)

- (CGFloat)textWidth {
    
    NSString *text = self.text;
    UIFont *font = self.font;
    CGSize textSize = [text sizeWithAttributes:@{NSFontAttributeName:font}];
    return textSize.width;
    
}

@end
