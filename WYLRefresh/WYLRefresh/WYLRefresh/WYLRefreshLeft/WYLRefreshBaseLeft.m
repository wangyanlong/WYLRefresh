//
//  WYLRefreshBaseLeft.m
//  WYLComic
//
//  Created by wyl on 2017/8/17.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBaseLeft.h"

@implementation WYLRefreshBaseLeft

+ (instancetype)leftWithRefreshingBlock:(wylRefreshBlock)block{
    
    WYLRefreshBaseLeft *left = [[self alloc] init];
    left.refreshingBlock = block;
    return left;
    
}

-(void)resetSubviews{
    
    [super resetSubviews];
    
    self.wyl_w = 50.0f;
    self.wyl_y = 0.0f;
    self.wyl_h = self.scrollView.wyl_h;
    self.wyl_x = -self.wyl_w;
    
}

- (void)scrollOffsetDidChange:(NSDictionary *)change{
    
    [super scrollOffsetDidChange:change];
    
    //scrollview的偏移量
    CGFloat xOffset = self.scrollView.contentOffset.x/self.scrollView.zoomScale;
    
    //刷新的临界值
    CGFloat boundaryOffset = self.originalScrollInsets.left + self.wyl_w;
    
    self.pullingPercent = -xOffset/boundaryOffset;
    
    if (self.state == WYLRefreshStateRefreshing){
        
        self.alpha = 1.0f;
        
        //往下拉的时候，yOffset是为负的
        CGFloat finalInsetLeft = (-xOffset > boundaryOffset)?boundaryOffset:-xOffset;
        self.scrollView.wyl_insetL = finalInsetLeft;
        
        return;
        
    }
    
    self.originalScrollInsets = self.scrollView.contentInset;
    
    //当拖动的时候
    if (self.scrollView.dragging) {
        
        self.alpha = self.pullingPercent;
        
        if (self.state == WYLRefreshStateIdle && -xOffset > boundaryOffset) {
            
            //当处于闲置状态且滑动的距离大于临界值,那么把状态置为释放就刷新状态
            self.state = WYLRefreshStatePulling;
            
        }else if (self.state == WYLRefreshStateIdle && -xOffset < boundaryOffset){
            
            //没有超过临界值,不做任何操作
            
        }else if (self.state == WYLRefreshStatePulling && -xOffset < boundaryOffset){
            
            //如果状态是松开即将刷新(证明之前已经拉动超过了临界值)
            //但是偏移量又小于了临界值(证明又拖动回到了scrollview的上沿)
            //那么置为闲置状态
            self.state = WYLRefreshStateIdle;
            
        }else if (self.state == WYLRefreshStatePulling && -xOffset > boundaryOffset){
            
            //已经超过临界值,不做任何处理,已经是准备刷新的状态
            
        }
        
    }else{//松手了
        
        //如果在松开既刷新的状态,那么就开始变为刷新状态
        if (self.state == WYLRefreshStatePulling){
            
            self.state = WYLRefreshStateRefreshing;
            
        }else if (_pullingPercent < 1){//如果不是松开既刷新的状态,那么肯定是闲置状态,也就是没到偏移量或者自己又滑动回上沿了,那么重置一下透明度
            
            self.alpha = _pullingPercent;
            
        }
        
    }
    
}

- (void)setState:(WYLRefreshState)state{
    
    [super setState:state];
    
    if (state == WYLRefreshStateRefreshing) {
        
        [UIView animateWithDuration:0.4f animations:^{
            
            self.scrollView.wyl_insetL = self.originalScrollInsets.left + self.wyl_w;
            self.scrollView.wyl_offsetX = -(self.originalScrollInsets.left + self.wyl_w);
            
        }];
        
        [self beginRefresh];
        
    }else if (state == WYLRefreshStateIdle){
        
        [UIView animateWithDuration:0.4f animations:^{
            
            self.scrollView.contentInset = self.originalScrollInsets;
            
        }];
        
    }
    
}

- (void)setPullingPercent:(CGFloat)pullingPercent {
    
    _pullingPercent = pullingPercent;
    
}

@end
