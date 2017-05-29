//
//  UIScrollView+WYLExtention.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "UIScrollView+WYLExtention.h"

@implementation UIScrollView (WYLExtention)

- (void)setWyl_insetT:(CGFloat)wyl_insetT
{
    UIEdgeInsets inset = self.contentInset;
    inset.top = wyl_insetT;
    self.contentInset = inset;
}

- (CGFloat)wyl_insetT
{
    return self.contentInset.top;
}

- (void)setWyl_insetB:(CGFloat)wyl_insetB
{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = wyl_insetB;
    self.contentInset = inset;
}

- (CGFloat)wyl_insetB
{
    return self.contentInset.bottom;
}

- (void)setWyl_insetL:(CGFloat)wyl_insetL
{
    UIEdgeInsets inset = self.contentInset;
    inset.left = wyl_insetL;
    self.contentInset = inset;
}

- (CGFloat)wyl_insetL
{
    return self.contentInset.left;
}

- (void)setWyl_insetR:(CGFloat)wyl_insetR
{
    UIEdgeInsets inset = self.contentInset;
    inset.right = wyl_insetR;
    self.contentInset = inset;
}

- (CGFloat)wyl_insetR
{
    return self.contentInset.right;
}

- (void)setWyl_offsetX:(CGFloat)wyl_offsetX
{
    CGPoint offset = self.contentOffset;
    offset.x = wyl_offsetX;
    self.contentOffset = offset;
}

- (CGFloat)wyl_offsetX
{
    return self.contentOffset.x;
}

- (void)setWyl_offsetY:(CGFloat)wyl_offsetY
{
    CGPoint offset = self.contentOffset;
    offset.y = wyl_offsetY;
    self.contentOffset = offset;
}

- (CGFloat)wyl_offsetY
{
    return self.contentOffset.y;
}

- (void)setWyl_contentW:(CGFloat)wyl_contentW
{
    CGSize size = self.contentSize;
    size.width = wyl_contentW;
    self.contentSize = size;
}

- (CGFloat)wyl_contentW
{
    return self.contentSize.width;
}

- (void)setWyl_contentH:(CGFloat)wyl_contentH
{
    CGSize size = self.contentSize;
    size.height = wyl_contentH;
    self.contentSize = size;
}

- (CGFloat)wyl_contentH
{
    return self.contentSize.height;
}

@end
