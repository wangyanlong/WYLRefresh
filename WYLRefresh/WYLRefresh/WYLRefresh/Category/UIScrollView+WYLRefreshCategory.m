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
const static char WYLRightKey = 'R';
const static char WYLLeftKey = 'L';

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

#pragma mark - right
- (void)setWylRight:(WYLRefreshBaseRight *)wylRight
{
    if (wylRight != self.wylRight) {
        // 删除旧的，添加新的
        [self.wylRight removeFromSuperview];
        [self insertSubview:wylRight atIndex:0];
        
        
        objc_setAssociatedObject(self, &WYLRightKey,
                                 wylRight, OBJC_ASSOCIATION_ASSIGN);
    }
}

-(WYLRefreshBaseRight *)wylRight{
    return objc_getAssociatedObject(self, &WYLRightKey);
}

#pragma mark - left
- (void)setWylLeft:(WYLRefreshBaseLeft *)wylLeft {
    
    if (wylLeft != self.wylLeft) {
        
        //删除旧的，添加新的
        [self.wylLeft removeFromSuperview];
        [self insertSubview:wylLeft atIndex:0];
        
        objc_setAssociatedObject(self, &WYLLeftKey, wylLeft, OBJC_ASSOCIATION_ASSIGN);
        
    }
    
}

- (WYLRefreshBaseLeft *)wylLeft{
    return objc_getAssociatedObject(self, &WYLLeftKey);
}

@end
