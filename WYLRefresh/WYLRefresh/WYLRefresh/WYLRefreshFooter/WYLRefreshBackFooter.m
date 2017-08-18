//
//  WYLRefreshBackFooter.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/31.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBackFooter.h"

@implementation WYLRefreshBackFooter

- (void)scrollViewContentSizeDidChange:(NSDictionary *)change{
    
    CGFloat contentSizeH = self.scrollView.wyl_contentH;

    CGFloat contentHeight = self.scrollView.wyl_h - self.originalScrollInsets.top - self.originalScrollInsets.bottom;
    
    self.wyl_y = MAX(contentSizeH, contentHeight);

}

- (void)scrollOffsetDidChange:(NSDictionary *)change{
    
    //如果正在刷新,直接返回
    if (self.state == WYLRefreshStateRefreshing){
        return;
    }
    
    self.originalScrollInsets = self.scrollView.contentInset;
    
    CGFloat yOffset = self.scrollView.wyl_offsetY;
    
    CGFloat boundaryOffset = [self boundaryOffset];
    
    //松开就刷新的点,应该是最后一屏的顶部的offsetY+self的高
    CGFloat pullingOffset = boundaryOffset + self.wyl_h;
    
    CGFloat pullingPercent = (yOffset - boundaryOffset)/self.wyl_h;
    
    if (yOffset > boundaryOffset) {//开始显示footer
        
        self.alpha = 1.f;
        
        if (self.scrollView.dragging) {
            
            self.alpha = pullingPercent;
            
            //如果offset超过屏幕顶部+footer高度的位置,那么状态变为一松开既刷新
            if (yOffset > pullingOffset && self.state == WYLRefreshStateIdle) {
                
                self.state = WYLRefreshStatePulling;
                
            }else if (yOffset < pullingOffset && self.state == WYLRefreshStatePulling){
                
                self.state = WYLRefreshStateIdle;
                
            }
            
        }else{
            
            //当松开的状态,不在滑动
            if (self.state == WYLRefreshStatePulling) {
                
                self.state = WYLRefreshStateRefreshing;
                
            } else if (pullingPercent < 1) {
                
                self.alpha = pullingPercent;
                
            }
            
        }
        
    }
    
}

- (void)setState:(WYLRefreshState)state{
    
    [super setState:state];
    
    if (state == WYLRefreshStateRefreshing) {
        
        [UIView animateWithDuration:0.4f animations:^{
           
            CGFloat bottom = self.wyl_h+self.originalScrollInsets.bottom;
            
            CGFloat contentSizeH = self.scrollView.wyl_contentH;
            CGFloat contentHeight = self.scrollView.wyl_h - self.originalScrollInsets.top - self.originalScrollInsets.bottom;
            
            CGFloat delH = contentSizeH - contentHeight;
            
            if (delH < 0) {// 如果内容高度小于view的高度
                bottom -= delH;
            }
            
            self.scrollView.wyl_insetB = bottom;
            
            //偏移量等于contentSizeH - 屏幕高度 + 自己的高度 + insetB
            self.scrollView.wyl_offsetY = [self boundaryOffset] + self.wyl_h + self.scrollView.wyl_insetB;
            
        } completion:^(BOOL finished) {
            
            [self beginRefresh];
            
        }];
        
    }else if (state == WYLRefreshStateIdle || state == WYLRefreshStateNoMoreData) {
        
        [UIView animateWithDuration:0.25f animations:^{
            
            self.scrollView.wyl_insetB = self.originalScrollInsets.bottom;
            
        } completion:^(BOOL finished) {
            
            
        }];
        
    }
    
}

- (CGFloat)boundaryOffset {
    
    //内容高度
    CGFloat contentSizeH = self.scrollView.wyl_contentH;
    
    //显示高度
    CGFloat contentHeight = self.scrollView.wyl_h - self.scrollView.wyl_insetT - self.scrollView.wyl_insetB;

    CGFloat finalY = MAX(contentSizeH, contentHeight);
    
    //得到滑动到最后一屏顶部的offsetY
    if (finalY == contentSizeH) {
        
        return contentSizeH - self.scrollView.wyl_h;
        
    }else{
        
        return -self.scrollView.wyl_insetT;

    }

}

@end
