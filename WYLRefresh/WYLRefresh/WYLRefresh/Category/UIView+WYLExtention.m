//
//  UIView+WYLExtention.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "UIView+WYLExtention.h"

@implementation UIView (WYLExtention)

- (void)setWyl_x:(CGFloat)eoc_x
{
    CGRect frame = self.frame;
    frame.origin.x = eoc_x;
    self.frame = frame;
}

- (CGFloat)wyl_x
{
    return self.frame.origin.x;
}

- (void)setWyl_y:(CGFloat)eoc_y
{
    CGRect frame = self.frame;
    frame.origin.y = eoc_y;
    self.frame = frame;
}

- (CGFloat)wyl_y
{
    return self.frame.origin.y;
}

- (void)setWyl_w:(CGFloat)eoc_w
{
    CGRect frame = self.frame;
    frame.size.width = eoc_w;
    self.frame = frame;
}

- (CGFloat)wyl_w
{
    return self.frame.size.width;
}

- (void)setWyl_h:(CGFloat)eoc_h
{
    CGRect frame = self.frame;
    frame.size.height = eoc_h;
    self.frame = frame;
}

- (CGFloat)wyl_h
{
    return self.frame.size.height;
}

- (void)setWyl_size:(CGSize)eoc_size
{
    CGRect frame = self.frame;
    frame.size = eoc_size;
    self.frame = frame;
}

- (CGSize)wyl_size
{
    return self.frame.size;
}

- (void)setWyl_origin:(CGPoint)eoc_origin
{
    CGRect frame = self.frame;
    frame.origin = eoc_origin;
    self.frame = frame;
}

- (CGPoint)wyl_origin
{
    return self.frame.origin;
}


@end
