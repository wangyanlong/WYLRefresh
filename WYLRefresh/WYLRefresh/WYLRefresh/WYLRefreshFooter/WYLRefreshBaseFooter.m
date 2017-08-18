//
//  WYLRefreshBaseFooter.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/30.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBaseFooter.h"

@implementation WYLRefreshBaseFooter

+ (instancetype)footerWithRefreshBlock:(wylRefreshBlock)block{
    
    WYLRefreshBaseFooter *footer = [[self alloc] init];
    footer.refreshingBlock = block;
    return footer;
    
}

- (void)endRefreshingWithNoMoreData{
    
    //把当前的时间存起来
    [[NSUserDefaults standardUserDefaults]setObject:[NSDate date] forKey:@"lastUpdateDate"];
    self.state = WYLRefreshStateNoMoreData;
    
}

- (void)resetSubviews{
    
    [super resetSubviews];
    
    self.wyl_y = self.scrollView.wyl_contentH;
    self.wyl_x = 0.0f;
    self.wyl_w = self.scrollView.wyl_w;
    self.wyl_h = 44;

}

@end
