//
//  WYLRefreshBaseRight.h
//  WYLComic
//
//  Created by wyl on 2017/8/17.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBaseView.h"

@interface WYLRefreshBaseRight : WYLRefreshBaseView

+ (instancetype)rightWithRefreshBlock:(wylRefreshBlock)block;

- (void)endRefreshingWithNoMoreData;


@end
