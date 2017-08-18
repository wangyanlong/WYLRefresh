//
//  WYLRefreshStateBackRight.m
//  WYLComic
//
//  Created by wyl on 2017/8/18.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshStateBackRight.h"

@interface WYLRefreshStateBackRight ()

@property (nonatomic, strong) NSMutableDictionary *stateTitlesDict;

@end

@implementation WYLRefreshStateBackRight

- (void)prepare{
    
    [super prepare];
    
    [self addSubview:self.stateLabel];
    [self addSubview:self.lastUpdateTimeLabel];
    
    //初始化文字
    [self setTitle:@"左拉即将购买新的章节哦" forState:WYLRefreshStateIdle];
    [self setTitle:@"松开就会购买啦" forState:WYLRefreshStatePulling];
    [self setTitle:@"正在购买" forState:WYLRefreshStateRefreshing];
    [self setTitle:@"没法再买啦" forState:WYLRefreshStateNoMoreData];

}

- (void)setTitle:(NSString *)title forState:(WYLRefreshState)state{
    
    self.stateTitlesDict[@(state)] = title;
    
}

- (void)resetSubviews{
    
    [super resetSubviews];
    
    self.stateLabel.frame = ({
        
        CGRect frame = self.bounds;
        frame.size.width = self.wyl_w/2;
        frame;
        
    });
    
    self.lastUpdateTimeLabel.frame = ({
        
        CGRect frame = self.bounds;
        frame.origin.x = self.stateLabel.wyl_x+self.stateLabel.wyl_w;
        frame.size.width = self.stateLabel.wyl_w;
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
        _stateLabel.numberOfLines = 0;
        
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
        _lastUpdateTimeLabel.numberOfLines = 0;
        
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
