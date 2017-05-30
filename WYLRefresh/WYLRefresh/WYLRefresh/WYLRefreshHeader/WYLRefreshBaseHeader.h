//
//  WYLRefreshBaseHeader.h
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBaseView.h"

@interface WYLRefreshBaseHeader : WYLRefreshBaseView

+ (instancetype)headerWithRefreshingBlock:(wylRefreshBlock)block;

@property (nonatomic, assign)CGFloat pullingPercent;//距离刷新拉动的百分比

@end
