//
//  WYLRefreshGifHeader.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/30.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshGifHeader.h"

@implementation WYLRefreshGifHeader

- (void)setImages:(NSArray *)images forState:(WYLRefreshState)state {
    
    [self setImages:images duration:images.count * 0.1 forState:state];
    
}

- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(WYLRefreshState)state{
    
    self.stateImages[@(state)] = images;
    self.stateAnimationDurations[@(state)] = @(duration);

}

#pragma mark - 覆盖父类方法
- (void)prepare {
    
    [super prepare];
    
    [self addSubview:self.gifImageView];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=60; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_anim__000%zd", i]];
        [idleImages addObject:image];
    }
    
    [self setImages:idleImages forState:WYLRefreshStateIdle];
    
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
        [refreshingImages addObject:image];
    }
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:WYLRefreshStateRefreshing];
    
}

- (void)resetSubviews{
    
    [super resetSubviews];

    CGFloat stateTextWidth = self.stateLabel.textWidth;
    CGFloat lastTimeTextWidth = self.lastUpdateTimeLabel.textWidth;
    CGFloat finalTextWidth = MAX(stateTextWidth, lastTimeTextWidth);
    _gifImageView.center = CGPointMake((self.wyl_w - finalTextWidth)/4, self.wyl_h/2-20.f);
    _gifImageView.image = [_stateImages[@(WYLRefreshStateIdle)] firstObject];
    _gifImageView.wyl_size = _gifImageView.image.size;
    
}

- (void)setPullingPercent:(CGFloat)pullingPercent{
    
    [super setPullingPercent:pullingPercent];
    
    NSArray *images = self.stateImages[@(WYLRefreshStateIdle)];
    if (self.state != WYLRefreshStateIdle || images.count == 0) return;
    // 停止动画
    [self.gifImageView stopAnimating];
    
    // 设置当前需要显示的图片
    NSUInteger index =  images.count * pullingPercent;
    if (index >= images.count) index = images.count - 1;
    self.gifImageView.image = images[index];
}

- (void)setState:(WYLRefreshState)state {
    
    [super setState:state];
    
    if (state == WYLRefreshStateRefreshing) {
    
        _gifImageView.animationImages = _stateImages[@(state)];
        _gifImageView.animationDuration = [_stateAnimationDurations[@(state)] doubleValue];
        [_gifImageView startAnimating];
        
    }else if (state == WYLRefreshStateIdle){
        [_gifImageView stopAnimating];
    }
    
}

#pragma mark - 懒加载
- (UIImageView *)gifImageView {
    
    if (!_gifImageView) {
        
        _gifImageView = [[UIImageView alloc] init];
        
    }
    return _gifImageView;
    
}

- (NSMutableDictionary *)stateImages {
    
    if (!_stateImages) {
        
        _stateImages = [NSMutableDictionary dictionary];
        
    }
    return _stateImages;
    
}

- (NSMutableDictionary *)stateAnimationDurations {
    
    if (!_stateAnimationDurations) {
        
        _stateAnimationDurations = [NSMutableDictionary dictionary];
        
    }
    return _stateAnimationDurations;
    
}

@end
