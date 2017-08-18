//
//  WYLRefreshBaseRight.m
//  WYLComic
//
//  Created by wyl on 2017/8/17.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBaseRight.h"

@implementation WYLRefreshBaseRight

+ (instancetype)rightWithRefreshBlock:(wylRefreshBlock)block{
    
    WYLRefreshBaseRight *right = [[self alloc] init];
    right.refreshingBlock = block;
    return right;
    
}

- (void)endRefreshingWithNoMoreData{
    
    //把当前的时间存起来
    [[NSUserDefaults standardUserDefaults]setObject:[NSDate date] forKey:@"lastUpdateDate"];
    self.state = WYLRefreshStateNoMoreData;
    
}

- (void)resetSubviews{
    
    [super resetSubviews];
    
    self.wyl_y = 0;
    self.wyl_x = self.scrollView.wyl_contentW;
    self.wyl_h = self.scrollView.wyl_h;
    self.wyl_w = 44;
    
}

@end
