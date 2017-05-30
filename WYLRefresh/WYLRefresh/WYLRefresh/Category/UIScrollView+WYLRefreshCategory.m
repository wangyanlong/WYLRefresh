//
//  UIScrollView+WYLRefreshCategory.m
//  WYLRefresh
//
//  Created by wyl on 2017/5/29.
//  Copyright © 2017年 wyl. All rights reserved.
//

#import "UIScrollView+WYLRefreshCategory.h"
#import <objc/runtime.h>

@implementation UIScrollView (WYLRefreshCategory)

const static char WYLHeaderKey = 'H';
const static char WYLFooterKey = 'F';

- (void)setWylHeader:(WYLRefreshBaseHeader *)wylHeader {
    
    if (wylHeader != self.wylHeader) {
        
        //删除旧的，添加新的
        [self.wylHeader removeFromSuperview];
        [self insertSubview:wylHeader atIndex:0];
        
        objc_setAssociatedObject(self, &WYLHeaderKey, wylHeader, OBJC_ASSOCIATION_ASSIGN);
        
    }
    
}

- (WYLRefreshBaseHeader *)wylHeader {
    
    return objc_getAssociatedObject(self, &WYLHeaderKey);
    
}

#pragma mark - footer
- (void)setWylFooter:(WYLRefreshBaseFooter *)wylFooter
{
    if (wylFooter != self.wylFooter) {
        // 删除旧的，添加新的
        [self.wylFooter removeFromSuperview];
        [self insertSubview:wylFooter atIndex:0];
        
        
        objc_setAssociatedObject(self, &WYLFooterKey,
                                 wylFooter, OBJC_ASSOCIATION_ASSIGN);
    }
}

- (WYLRefreshBaseFooter *)wylFooter {
    
    return objc_getAssociatedObject(self, &WYLFooterKey);
    
}

@end
