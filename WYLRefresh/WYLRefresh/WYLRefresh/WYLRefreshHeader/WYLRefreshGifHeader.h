//
//  WYLRefreshGifHeader.h
//  WYLRefresh
//
//  Created by wyl on 2017/5/30.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "WYLRefreshStateHeader.h"

@interface WYLRefreshGifHeader : WYLRefreshStateHeader

- (void)setImages:(NSArray *)images forState:(WYLRefreshState)state;

@property (nonatomic, strong)UIImageView *gifImageView;
@property (nonatomic, strong)NSArray *images;
@property (nonatomic, strong)NSMutableDictionary *stateImages;
@property (nonatomic, strong)NSMutableDictionary *stateAnimationDurations;

@end
