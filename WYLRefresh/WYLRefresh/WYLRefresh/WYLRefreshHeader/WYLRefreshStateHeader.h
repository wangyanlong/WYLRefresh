//
//  WYLRefreshStateHeader.h
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBaseHeader.h"

@interface WYLRefreshStateHeader : WYLRefreshBaseHeader

/**
 显示状态的label
 */
@property (nonatomic, strong) UILabel *stateLabel;

/**
 上次刷新时间的label
 */
@property (nonatomic, strong) UILabel *lastUpdateTimeLabel;

@end
