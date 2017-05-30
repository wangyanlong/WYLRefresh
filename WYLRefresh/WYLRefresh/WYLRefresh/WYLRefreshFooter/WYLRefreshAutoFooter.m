//
//  WYLRefreshAutoFooter.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/30.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshAutoFooter.h"

@implementation WYLRefreshAutoFooter

- (void)willMoveToSuperview:(UIView *)newSuperview{
    
    [super willMoveToSuperview:newSuperview];
    
    if (newSuperview) {
        
        //重置scrollview的contentInset
        self.scrollView.wyl_insetB = self.wyl_h;
        self.wyl_y = self.scrollView.wyl_contentH;
        
    }else{
        
        self.scrollView.wyl_insetB = self.originalScrollInsets.bottom;
        
    }
    
}

- (void)setState:(WYLRefreshState)state{
    
    [super setState:state];
    
    if (state == WYLRefreshStateRefreshing) {
    
        [self beginRefresh];
    
    }
    
}

- (void)scrollViewContentSizeDidChange:(NSDictionary *)change{
    
    [super scrollViewContentSizeDidChange:change];
    
    self.wyl_y = self.scrollView.wyl_contentH;
    
}

- (void)scrollOffsetDidChange:(NSDictionary *)change{
    
    [super scrollOffsetDidChange:change];
    
    if (self.scrollView.wyl_h < self.scrollView.wyl_contentH + self.scrollView.wyl_insetT + self.wyl_h) {
        
        if (self.scrollView.wyl_offsetY >= self.scrollView.wyl_contentH - self.scrollView.wyl_h) {
            
            // 完全显示出footer
            // 防止手松开时连续调用
            CGPoint old = [change[@"old"] CGPointValue];
            CGPoint new = [change[@"new"] CGPointValue];
            if (new.y <= old.y) return;
            
            self.state = WYLRefreshStateRefreshing;

        }
        
    }
    
}

- (void)scrollViewGestureStateDidChange:(NSDictionary *)change {
    
    //如果在一屏的时候
    if (self.scrollView.wyl_h > self.scrollView.wyl_contentH + self.scrollView.wyl_insetT) {
        
        CGPoint transitionPoint = [self.scrollView.panGestureRecognizer translationInView:self.scrollView];
        
        if (transitionPoint.y < 0 && self.scrollView.panGestureRecognizer.state == UIGestureRecognizerStateEnded)
        {
            //刚刚往上拉
            self.state = WYLRefreshStateRefreshing;
            
        }
        
    } else {  //超过一屏的时候
        
        if (self.scrollView.wyl_offsetY >= self.scrollView.wyl_contentH + self.scrollView.wyl_insetB - self.scrollView.wyl_h) {
            
            self.state = WYLRefreshStateRefreshing;
        }
        
    }
    
}

@end
