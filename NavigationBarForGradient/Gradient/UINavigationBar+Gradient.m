//
//  UINavigationBar+Gradient.m
//  Gradually
//
//  Created by 韩陈昊 on 2016/10/28.
//  Copyright © 2016年 韩陈昊. All rights reserved.
//

#import "UINavigationBar+Gradient.h"
#import <objc/runtime.h>

@interface UINavigationBar ()


/**
 导航条遮罩
 */
@property (nonatomic , strong) UIView *maskView;

@end

@implementation UINavigationBar (Gradient)
static char maskKey;

#pragma mark -setter and getter

- (UIView *)maskView {
    return objc_getAssociatedObject(self, &maskKey);
    
}

- (void)setMaskView:(UIView *)maskView {
    objc_setAssociatedObject(self, &maskKey, maskView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -设置渐变相关方法

- (void) ch_setBackgroundColor:(UIColor *) color  alpha:(CGFloat) alpha{
    
    if (!self.maskView) {
        [self setBackgroundImage:[[UIImage alloc] init] forBarMetrics:(UIBarMetricsDefaultPrompt)];
        self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.maskView.userInteractionEnabled = NO;
        self.maskView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [[self.subviews firstObject] insertSubview:self.maskView atIndex:0];
        
    }
    self.maskView.backgroundColor = [color colorWithAlphaComponent:alpha];
}


- (void) ch_setBackgroundColor:(UIColor *) color{
    if (!self.maskView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        
        self.maskView.userInteractionEnabled = NO;
        self.maskView.autoresizingMask = UIViewAutoresizingFlexibleWidth;    // Should not set `UIViewAutoresizingFlexibleHeight`
        [[self.subviews firstObject] insertSubview:self.maskView atIndex:0];
    }
    self.maskView.backgroundColor = color;
}



- (void)ch_setTranslationY:(CGFloat)translationY {
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}


- (void)ch_setElementsAlpha:(CGFloat)alpha {
    //  kvo
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}



- (void)ch_setNavigationBarTransformProgress:(CGFloat)progress value:(CGFloat) value
{
    [self ch_setTranslationY:(-(value) * progress)];
    [self ch_setElementsAlpha:(1-progress)];
}



- (void)ch_reset {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.maskView removeFromSuperview];
    self.maskView = nil;
}

@end
