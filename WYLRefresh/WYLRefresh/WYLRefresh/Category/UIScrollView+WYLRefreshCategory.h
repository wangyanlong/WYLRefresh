//
//  UIScrollView+WYLRefreshCategory.h
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYLRefreshBaseHeader.h"
#import "WYLRefreshBaseFooter.h"
#import "WYLRefreshBaseLeft.h"
#import "WYLRefreshBaseRight.h"

@interface UIScrollView (WYLRefreshCategory)

@property(nonatomic, strong)WYLRefreshBaseHeader *wylHeader;
@property(nonatomic, strong)WYLRefreshBaseFooter *wylFooter;
@property(nonatomic, strong)WYLRefreshBaseLeft   *wylLeft;
@property(nonatomic, strong)WYLRefreshBaseRight  *wylRight;

@end
