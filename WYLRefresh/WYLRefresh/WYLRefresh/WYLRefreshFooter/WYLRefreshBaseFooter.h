//
//  WYLRefreshBaseFooter.h
//  WYLRefresh
//
//  Created by wyl on 2017/5/30.
//  Copyright © 2017年 wyl. All rights reserved.
//
#import "WYLRefreshBaseView.h"
#import <UIKit/UIKit.h>

@interface WYLRefreshBaseFooter : WYLRefreshBaseView

+ (instancetype)footerWithRefreshBlock:(wylRefreshBlock)block;

- (void)endRefreshingWithNoMoreData;

@end
