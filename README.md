# 简介

一个UINavigationBar分类,可以动态改变导航栏的透明度以及大小.

## 手动安装

###1
通过 Clone or download 下载 NavigationBarForGradient 文件夹内的所有内容。

###2
将 Gradient 内的源文件添加(拖放)到你的工程。

###3
导入UINavigationBar+Gradient.h

###4
```objc
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
```



## 效果

## 许可
EmptyViewSet 使用 MIT 许可证，详情见 LICENSE 文件。


## 联系方式
邮箱:hanchenhao@vip.qq.com




