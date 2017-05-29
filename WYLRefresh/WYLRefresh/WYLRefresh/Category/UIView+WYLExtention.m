//
//  UIView+WYLExtention.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "UIView+WYLExtention.h"

@implementation UIView (WYLExtention)

- (void)setWyl_x:(CGFloat)wyl_x
{
    CGRect frame = self.frame;
    frame.origin.x = wyl_x;
    self.frame = frame;
}

- (CGFloat)wyl_x
{
    return self.frame.origin.x;
}

- (void)setWyl_y:(CGFloat)wyl_y
{
    CGRect frame = self.frame;
    frame.origin.y = wyl_y;
    self.frame = frame;
}

- (CGFloat)wyl_y
{
    return self.frame.origin.y;
}

- (void)setWyl_w:(CGFloat)wyl_w
{
    CGRect frame = self.frame;
    frame.size.width = wyl_w;
    self.frame = frame;
}

- (CGFloat)wyl_w
{
    return self.frame.size.width;
}

- (void)setWyl_h:(CGFloat)wyl_h
{
    CGRect frame = self.frame;
    frame.size.height = wyl_h;
    self.frame = frame;
}

- (CGFloat)wyl_h
{
    return self.frame.size.height;
}

- (void)setWyl_size:(CGSize)wyl_size
{
    CGRect frame = self.frame;
    frame.size = wyl_size;
    self.frame = frame;
}

- (CGSize)wyl_size
{
    return self.frame.size;
}

- (void)setWyl_origin:(CGPoint)wyl_origin
{
    CGRect frame = self.frame;
    frame.origin = wyl_origin;
    self.frame = frame;
}

- (CGPoint)wyl_origin
{
    return self.frame.origin;
}


@end
