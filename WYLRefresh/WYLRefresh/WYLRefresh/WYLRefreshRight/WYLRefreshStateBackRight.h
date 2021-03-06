//
//  WYLRefreshStateBackRight.h
//  WYLComic
//
//  Created by wyl on 2017/8/18.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBackRight.h"

@interface WYLRefreshStateBackRight : WYLRefreshBackRight

/**
 显示状态的label
 */
@property (nonatomic, strong) UILabel *stateLabel;

/**
 上次刷新时间的label
 */
@property (nonatomic, strong) UILabel *lastUpdateTimeLabel;

@end
