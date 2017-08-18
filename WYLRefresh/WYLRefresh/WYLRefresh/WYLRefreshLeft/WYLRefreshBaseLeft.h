//
//  WYLRefreshBaseLeft.h
//  WYLComic
//
//  Created by wyl on 2017/8/17.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBaseView.h"

@interface WYLRefreshBaseLeft : WYLRefreshBaseView

+ (instancetype)leftWithRefreshingBlock:(wylRefreshBlock)block;

@property (nonatomic, assign)CGFloat pullingPercent;//距离刷新拉动的百分比
@end
