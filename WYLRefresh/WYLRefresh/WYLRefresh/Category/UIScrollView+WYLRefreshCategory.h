//
//  UIScrollView+WYLRefreshCategory.h
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYLRefreshBaseHeader.h"

@interface UIScrollView (WYLRefreshCategory)

@property(nonatomic, strong)WYLRefreshBaseHeader *wylHeader;

@end