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
    
    self.state = WYLRefreshStateNoMoreData;
    
}

- (void)prepare{
    
    [super prepare];
    
    self.wyl_h = 44;
    
}

@end
