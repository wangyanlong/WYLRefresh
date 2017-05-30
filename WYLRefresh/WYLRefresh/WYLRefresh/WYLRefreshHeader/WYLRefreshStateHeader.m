//
//  WYLRefreshStateHeader.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshStateHeader.h"

@interface WYLRefreshStateHeader ()

@property (nonatomic, strong) NSMutableDictionary *stateTitlesDict;

@end

@implementation WYLRefreshStateHeader

- (void)prepare{
    
    [super prepare];
    
    [self addSubview:self.stateLabel];
    [self addSubview:self.lastUpdateTimeLabel];
    
    //初始化文字
    [self setTitle:@"下拉即将刷新" forState:WYLRefreshStateIdle];
    [self setTitle:@"松开就会刷新" forState:WYLRefreshStatePulling];
    [self setTitle:@"正在刷新..." forState:WYLRefreshStateRefreshing];
    
}

- (void)setTitle:(NSString *)title forState:(WYLRefreshState)state{
    
    self.stateTitlesDict[@(state)] = title;
    
}

- (void)resetSubviews{
    
    [super resetSubviews];
    
    self.stateLabel.frame = ({
    
        CGRect frame = self.bounds;
        frame.size.height = self.wyl_h/2;
        frame;
        
    });
    
    self.lastUpdateTimeLabel.frame = ({
        
        CGRect frame = self.bounds;
        frame.origin.y = self.stateLabel.wyl_h;
        frame.size.height = self.stateLabel.wyl_h;
        frame;
        
    });
    
}

- (void)setState:(WYLRefreshState)state{
    
    [super setState:state];
    
    self.stateLabel.text = self.stateTitlesDict[@(state)];
    self.lastUpdateTimeLabel.text = [self lastUpdatedTime];
    
}

- (NSString *)lastUpdatedTime{
    
    NSDate *lastUpdateDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastUpdateDate"];
    
    if (!lastUpdateDate) {
        return @"暂无刷新纪录";
    }else{
        
        NSDate *today = [NSDate date];
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        //格式化时间
        NSCalendarUnit unitFlags = NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitMinute;
        
        NSDateComponents *cmp1 = [calendar components:unitFlags fromDate:today];
        NSDateComponents *cmp2 = [calendar components:unitFlags fromDate:lastUpdateDate];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        if ([cmp1 day] == [cmp2 day]) {
            
            formatter.dateFormat = @" HH:mm";
            
        } else if ([cmp1 month] == [cmp2 month]) {
            
            formatter.dateFormat = @" dd HH:mm";
            
        } else if ([cmp1 year] == [cmp2 year]) {
            
            formatter.dateFormat = @"MM-dd HH:mm";
            
        } else {
            
            formatter.dateFormat = @"yyyy-MM-dd HH:mm";
            
        }
        
        return [formatter stringFromDate:lastUpdateDate];
    }
    
    return nil;
    
}

#pragma mark - 懒加载
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

- (UILabel *)lastUpdateTimeLabel {
    
    if (!_lastUpdateTimeLabel) {
        
        _lastUpdateTimeLabel = [[UILabel alloc] init];
        
        _lastUpdateTimeLabel.font = [UIFont systemFontOfSize:14.f];
        _lastUpdateTimeLabel.backgroundColor = [UIColor clearColor];
        _lastUpdateTimeLabel.textColor = [UIColor blueColor];
        _lastUpdateTimeLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _lastUpdateTimeLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    
    return _lastUpdateTimeLabel;
}

- (NSMutableDictionary *)stateTitlesDict {
    
    if (!_stateTitlesDict) {
        
        _stateTitlesDict = [NSMutableDictionary dictionary];
        
    }
    return _stateTitlesDict;
    
}

@end
