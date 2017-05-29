//
//  WYLRefreshBaseView.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshBaseView.h"
#import "UIView+WYLExtention.h"

@implementation WYLRefreshBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self prepare];
        
        self.state = WYLRefreshStateIdle;
    
    }
    
    return self;
    
}

- (void)prepare{
    
    self.backgroundColor = [UIColor colorWithRed:(arc4random()%255/255.0) green:(arc4random()%255/255.0) blue:(arc4random()%255/255.0) alpha:1];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;//self的宽度会随着superView的宽度改变
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self resetSubviews];
    
}

/**
 再添加到superView之前,配置一些基本信息
 */
- (void)willMoveToSuperview:(UIView *)newSuperview{
    
    if (newSuperview && [newSuperview isKindOfClass:[UIScrollView class]]) {
        
        self.scrollView = (UIScrollView *)newSuperview;
        self.originalScrollInsets = self.scrollView.contentInset;
        
        self.wyl_x = 0.0f;
        self.wyl_w = self.scrollView.wyl_w;
        
        [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
        [_scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
        [_scrollView.panGestureRecognizer addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        
        [self scrollOffsetDidChange:change];
        
    } else if ([keyPath isEqualToString:@"contentSize"]) {
        
        [self scrollViewContentSizeDidChange:change];
        
    } else if ([keyPath isEqualToString:@"state"]) {
        
        [self scrollViewGestureStateDidChange:change];
        
    }
    
}

- (void)setState:(WYLRefreshState)state{
    
    _state = state;
    
}

- (void)endRefresh{
    
    self.state = WYLRefreshStateIdle;
    
}

- (void)beginRefresh{
    
    if (_refreshingBlock) {
        
        _refreshingBlock();
        
    }
    
}

#pragma mark - 需要子类覆盖

- (void)resetSubviews{}

- (void)scrollOffsetDidChange:(NSDictionary *)change {}

- (void)scrollViewContentSizeDidChange:(NSDictionary *)change {}

- (void)scrollViewGestureStateDidChange:(NSDictionary *)change {}

@end
