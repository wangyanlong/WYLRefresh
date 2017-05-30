//
//  WYLRefreshAutoStateFooter.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/30.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshAutoStateFooter.h"

@implementation WYLRefreshAutoStateFooter

- (void)prepare{
    
    [super prepare];
    
    [self addSubview:self.stateLabel];
    
    [self setStateTitle:WYLRefreshStateIdle title:@"点击或上拉加载更多"];
    [self setStateTitle:WYLRefreshStateRefreshing title:@"正在加载更多的数据..."];
    [self setStateTitle:WYLRefreshStateNoMoreData title:@"已经全部加载完毕"];
    
}

- (void)resetSubviews {
    
    [super resetSubviews];
    self.stateLabel.frame = self.bounds;
    
}

- (void)setState:(WYLRefreshState)state {
    
    [super setState:state];
    self.stateLabel.text = self.stateTitleDict[@(state)];
    
}

//懒加载实现
- (UILabel *)stateLabel {
    
    if (!_stateLabel) {
        
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.font = [UIFont systemFontOfSize:14.f];
        _stateLabel.backgroundColor = [UIColor clearColor];
        _stateLabel.textColor = [UIColor blueColor];
        _stateLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _stateLabel;
    
}

- (NSMutableDictionary *)stateTitleDict {
    
    if (!_stateTitleDict) {
        _stateTitleDict = [NSMutableDictionary dictionary];
    }
    return _stateTitleDict;
    
}

- (void)setStateTitle:(WYLRefreshState)state title:(NSString *)title {
    
    self.stateTitleDict[@(state)] = title;
    
}

@end
