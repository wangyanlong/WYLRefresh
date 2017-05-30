//
//  WYLRefreshNormalHeader.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/30.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshNormalHeader.h"

@implementation WYLRefreshNormalHeader

- (void)prepare{
    
    [super prepare];

    [self addSubview:self.arrowImageView];
    [self addSubview:self.loadView];

}

- (void)resetSubviews{
    
    [super resetSubviews];
    
    CGFloat stateTextWidth = self.stateLabel.textWidth;
    CGFloat lastTimeTextWidth = self.lastUpdateTimeLabel.textWidth;
    
    CGFloat finalTextWidth = (stateTextWidth > lastTimeTextWidth)?stateTextWidth:lastTimeTextWidth;
    
    //把iamge的size给到arrowImageView
    self.arrowImageView.wyl_size = self.arrowImageView.image.size;
    
    //arrowImageView的位置在按照文字最长度4等分之后的左边
    self.arrowImageView.center = CGPointMake((self.wyl_w - finalTextWidth)/4, self.wyl_h/2);
    self.loadView.center = CGPointMake((self.wyl_w - finalTextWidth)/4, self.wyl_h/2);
    
}

- (void)setState:(WYLRefreshState)state{
    
    [super setState:state];
    
    if (self.state == WYLRefreshStateIdle) {
        
        [UIView animateWithDuration:0.4f animations:^{
           
            _arrowImageView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            [self.loadView stopAnimating];
            _arrowImageView.alpha = 1.0f;
            
        }];
        
    }else if (self.state == WYLRefreshStatePulling) {
        
        [UIView animateWithDuration:0.4f animations:^{
            
            _arrowImageView.transform = CGAffineTransformMakeRotation(M_PI);
            
        }];
        
    } else if (self.state == WYLRefreshStateRefreshing) {
        
        _arrowImageView.alpha = 0.f;
        [_loadView startAnimating];
        
    }
    
}

#pragma mark - 懒加载
- (UIImageView *)arrowImageView {
    
    if (!_arrowImageView) {
        
        UIImage *image = [UIImage imageNamed:@"arrow"];
        
        _arrowImageView = [[UIImageView alloc] initWithImage:image];
        
        _arrowImageView.tintColor = self.stateLabel.textColor;
        
    }
    
    return _arrowImageView;
}

- (UIActivityIndicatorView *)loadView {
    
    if (!_loadView) {
        
        _loadView = [[UIActivityIndicatorView alloc] init];
        _loadView.tintColor = self.stateLabel.textColor;
        
    }
    
    return _loadView;
}

@end
