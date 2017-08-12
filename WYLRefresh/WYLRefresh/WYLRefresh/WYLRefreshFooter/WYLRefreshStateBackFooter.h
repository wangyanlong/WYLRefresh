//
//  WYLRefreshStateBackFooter.h
//  WYLRefresh
//
//  Created by wyl on 2017/8/11.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBackFooter.h"

@interface WYLRefreshStateBackFooter : WYLRefreshBackFooter

/**
 显示状态的label
 */
@property (nonatomic, strong) UILabel *stateLabel;

/**
 上次刷新时间的label
 */
@property (nonatomic, strong) UILabel *lastUpdateTimeLabel;

@end
