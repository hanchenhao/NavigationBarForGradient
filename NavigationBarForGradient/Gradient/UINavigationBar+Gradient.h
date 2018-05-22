//
//  UINavigationBar+Gradient.h
//  Gradually
//
//  Created by 韩陈昊 on 2016/10/28.
//  Copyright © 2016年 韩陈昊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Gradient)


/**
 设置背景色

 @param color 背景颜色
 @param alpha 透明度
 */
- (void) ch_setBackgroundColor:(UIColor *) color  alpha:(CGFloat) alpha ;



/**
 设置背景色

 @param color 透明度
 */
- (void) ch_setBackgroundColor:(UIColor *) color;
/**
 设置形变量

 @param translationY Y轴形变量
 */
- (void)ch_setTranslationY:(CGFloat)translationY ;

/**
 设置形变量
 
 @param progress Y轴形变量
 @param value 形变参考值
 */
- (void)ch_setNavigationBarTransformProgress:(CGFloat)progress value:(CGFloat) value;


/**
 设置空间元素透明度

 @param alpha 透明度
 */
- (void)ch_setElementsAlpha:(CGFloat)alpha;


/**
 重置
 */
- (void)ch_reset;

@end
