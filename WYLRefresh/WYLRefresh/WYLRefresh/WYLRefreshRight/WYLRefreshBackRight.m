//
//  WYLRefreshBackRight.m
//  WYLComic
//
//  Created by wyl on 2017/8/18.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBackRight.h"

@implementation WYLRefreshBackRight

- (void)scrollViewContentSizeDidChange:(NSDictionary *)change{
    
    CGFloat contentSizeW = self.scrollView.wyl_contentW;
    
    CGFloat contentWidth = self.scrollView.wyl_w - self.originalScrollInsets.left - self.originalScrollInsets.right;
    
    self.wyl_x = MAX(contentSizeW, contentWidth);
    
}

- (void)scrollOffsetDidChange:(NSDictionary *)change{
    
    //如果正在刷新,直接返回
    if (self.state == WYLRefreshStateRefreshing){
        return;
    }
    
    self.originalScrollInsets = self.scrollView.contentInset;
    
    CGFloat xOffset = self.scrollView.wyl_offsetX;
    
    CGFloat boundaryOffset = [self boundaryOffset];
    
    //松开就刷新的点,应该是最后一屏的左边的offsetX+self的宽
    CGFloat pullingOffset = boundaryOffset + self.wyl_w;
    
    CGFloat pullingPercent = (xOffset - boundaryOffset)/self.wyl_w;
    
    if (xOffset > boundaryOffset) {//开始显示right
        
        self.alpha = 1.f;
        
    }
        
    if (self.scrollView.dragging) {
        
        self.alpha = pullingPercent;
        
        //如果offset超过屏幕顶部+footer高度的位置,那么状态变为一松开既刷新
        if (xOffset > pullingOffset && self.state == WYLRefreshStateIdle) {
            
            self.state = WYLRefreshStatePulling;
            
        }else if (xOffset < pullingOffset && self.state == WYLRefreshStatePulling){
            
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

- (void)setState:(WYLRefreshState)state{
    
    [super setState:state];
    
    if (state == WYLRefreshStateRefreshing) {
        
        [UIView animateWithDuration:0.4f animations:^{
            
            CGFloat right = self.wyl_w+self.originalScrollInsets.right;
            
            CGFloat contentSizeW = self.scrollView.wyl_contentW;
            CGFloat contentWidth = self.scrollView.wyl_w - self.originalScrollInsets.left - self.originalScrollInsets.right;
            
            CGFloat delW = contentSizeW - contentWidth;
            
            if (delW < 0) {// 如果内容高度小于view的高度
                right -= delW;
            }
            
            self.scrollView.wyl_insetR = right;
            
            //偏移量等于contentSizeH - 屏幕高度 + 自己的高度 + insetB
            self.scrollView.wyl_offsetX = [self boundaryOffset] + self.wyl_w + self.scrollView.wyl_insetR;
            
        } completion:^(BOOL finished) {
            
            [self beginRefresh];
            
        }];
        
    }else if (state == WYLRefreshStateIdle || state == WYLRefreshStateNoMoreData) {
        
        [UIView animateWithDuration:0.25f animations:^{
            
            self.scrollView.wyl_insetR = self.originalScrollInsets.right;
            
        } completion:^(BOOL finished) {
            
            
        }];
        
    }
    
}

- (CGFloat)boundaryOffset {
    
    //内容高度
    CGFloat contentSizeW = self.scrollView.wyl_contentW;
    
    //显示高度
    CGFloat contentWidth = self.scrollView.wyl_w - self.scrollView.wyl_insetL - self.scrollView.wyl_insetR;
    
    CGFloat finalX = MAX(contentSizeW, contentWidth);
    
    //得到滑动到最后一屏顶部的offsetY
    if (finalX == contentSizeW) {
        
        return contentSizeW - self.scrollView.wyl_w;
        
    }else{
        
        return -self.scrollView.wyl_insetL;
        
    }
    
}

@end
