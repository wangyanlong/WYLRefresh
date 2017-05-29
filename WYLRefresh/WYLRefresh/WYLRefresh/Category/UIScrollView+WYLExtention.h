//
//  UIScrollView+WYLExtention.h
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (WYLExtention)

@property (assign, nonatomic) CGFloat wyl_insetT;
@property (assign, nonatomic) CGFloat wyl_insetB;
@property (assign, nonatomic) CGFloat wyl_insetL;
@property (assign, nonatomic) CGFloat wyl_insetR;

@property (assign, nonatomic) CGFloat wyl_offsetX;
@property (assign, nonatomic) CGFloat wyl_offsetY;

@property (assign, nonatomic) CGFloat wyl_contentW;
@property (assign, nonatomic) CGFloat wyl_contentH;

@end
