//
//  WYLRefreshBaseView.h
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//  纯模仿MJRefresh

#import <UIKit/UIKit.h>

/**
 刷新的几种状态
 */
typedef NS_ENUM(NSInteger, WYLRefreshState) {

    WYLRefreshStateIdle = 1,        //闲置状态
    WYLRefreshStatePulling,         //正在拉动的状态(释放就刷新)
    WYLRefreshStateRefreshing,      //正在刷新状态
    WYLRefreshStateWillRefresh,     //即将刷新
    WYLRefreshStateNoMoreData       //没有数据
    
};

typedef void(^wylRefreshBlock)(void);

@interface WYLRefreshBaseView : UIView

/**
 刷新的时候调用的block
 */
@property (nonatomic, strong)wylRefreshBlock refreshingBlock;

/**
 刷新的状态
 */
@property (nonatomic, assign)WYLRefreshState state;

/**
 copy所要添加的scrollview
 */
@property (nonatomic, weak)UIScrollView *scrollView;

/**
 copy所要添加的内边距
 */
@property (nonatomic, assign)UIEdgeInsets originalScrollInsets;

#pragma mark - 开放一些方法

/**
 准备方法
 */
- (void)prepare;

/**
 布置subViews
 */
- (void)placeSubviews;

/**
 开始刷新
 */
- (void)beginRefresh;

/**
 结束刷新
 */
- (void)endRefresh;

/**
 scrollview滑动的时候调用的方法

 @param change 改变的内容
 */
- (void)scrollOffsetDidChange:(NSDictionary *)change;

/**
 scrollview的contentSize改变的时候调用的方法

 @param change 改变的内容
 */
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change;

/**
 scrollview的手势状态改变的时候调用的方法

 @param change 改变的内容
 */
- (void)scrollViewGestureStateDidChange:(NSDictionary *)change;

@end
