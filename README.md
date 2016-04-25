# GDQrCode
##使用 AVFoundation/AVFoundation.h 实现二维码的生成
###1.可实现二维码颜色 背景色 自定义
###2.可实现二维码 背景色的透明度的设置
###3.可在二维码中心加图片(logo)

# 不设置背景色时默认背景色为白色
##可以设置颜色的alpha,可使用colorWithAlphaComponent: 及 colorWithRed:green:blue:alpha:来设置alpha

### 可自定义大小 颜色 (只能设置颜色的alpha  想设置背景色的alpha时可以使用设置背景色的时候设置背景色的alpha)

```objc
/**
*  创建一个有大小颜色的二维码图片
*
*  @param size         二维码的大小(宽高相等)
*  @param codeColor    二维码的颜色
*  @param inputMessage 二维码的内容
*
*  @return 返回一个二维码
*/
- (instancetype)initWithSize:  color:  message: ;
+ (instancetype)gd_codeImageWithSize:  color:  message: ;

/**
*  创建一个二维码图片
*
*  @param inputMessage 二维码内容
*
*  @return 返回一个二维码
*/
- (instancetype)initWithMessage: ;
+ (instancetype)gd_codeImageWithMessage: ;

/**
*  创建一个自定义大小的二维码
*
*  @param size         二维码的大小
*  @param inputMessage 二维码的内容
*
*  @return 返回一个二维码
*/
- (instancetype)initWithSize:  message: ;
+ (instancetype)gd_codeImageWithSize:  message: ;

/**
*  创建一个自定义颜色的二维码
*
*  @param codeColor    二维码的颜色
*  @param inputMessage 二维码的内容
*
*  @return 返回一个二维码
*/
- (instancetype)initWithColor:  message: ;
+ (instancetype)gd_codeImageWithColor:  message: ;


```


### 可自定义大小 颜色 logo

```objc
/**
*  创建一个有大小颜色的二维码图片(含有logo)
*
*  @param size         二维码的大小(宽高相等)
*  @param codeColor    二维码的颜色
*  @param inputMessage 二维码的内容
*  @param inputMessage 中心图片
*
*  @return 返回一个二维码
*/
- (instancetype)initWithSize:  color:  message:  centerImage: ;
+ (instancetype)gd_codeImageWithSize:  color:  message:  centerImage: ;

/**
*  创建一个二维码图片(含有logo)
*
*  @param inputMessage 二维码内容
*  @param inputMessage 中心图片
*
*  @return 返回一个二维码
*/
- (instancetype)initWithMessage:  centerImage: ;
+ (instancetype)gd_codeImageWithMessage:  centerImage: ;

/**
*  创建一个自定义大小的二维码(含有logo)
*
*  @param size         二维码的大小
*  @param inputMessage 二维码的内容
*  @param inputMessage 中心图片
*
*  @return 返回一个二维码
*/
- (instancetype)initWithSize:  message:  centerImage: ;
+ (instancetype)gd_codeImageWithSize:  message:  centerImage: ;

/**
*  创建一个自定义颜色的二维码(含有logo)
*
*  @param codeColor    二维码的颜色
*  @param inputMessage 二维码的内容
*  @param inputMessage 中心图片
*
*  @return 返回一个二维码
*/
- (instancetype)initWithColor:  message:  centerImage: ;
+ (instancetype)gd_codeImageWithColor:  message:  centerImage: ;

```



### 可自定义大小 颜色 背景色 logo(可以设置颜色及背景色的alpha)

```objc
/**
*  创建一个有大小 颜色 背景色 (含有logo)
*
*  @param size         二维码的大小
*  @param codeColor    二维码的颜色
*  @param bgColor      二维码的背景色
*  @param inputMessage 二维码信息
*  @param centerImage  二维码中心图片
*
*  @return 创建的二维码
*/
- (instancetype)initWithSize:  color:  bgColor:  message:  centerImage: ;
+ (instancetype)gd_codeImageWithSize:  color:  bgColor:  message:  centerImage: ;

/**
*  创建一个有颜色 背景色 (含有logo)默认大小
*
*  @param codeColor    二维码的颜色
*  @param bgColor      二维码的背景色
*  @param inputMessage 二维码信息
*  @param centerImage  二维码中心图片
*
*  @return 创建的二维码
*/
- (instancetype)initWithColor:  bgColor:  message:  centerImage: ;
+ (instancetype)gd_codeImageWithColor:  bgColor:  message:  centerImage: ;

/**
*  创建一个有大小  背景色 (含有logo)默认颜色
*
*  @param size         二维码的大小
*  @param bgColor      二维码的背景色
*  @param inputMessage 二维码信息
*  @param centerImage  二维码中心图片
*
*  @return 创建的二维码
*/
- (instancetype)initWithSize:  bgColor:  message:  centerImage: ;
+ (instancetype)gd_codeImageWithSize:  bgColor:  message:  centerImage: ;

/**
*  创建一个有大小 颜色 背景色 (不含有logo)
*
*  @param size         二维码的大小
*  @param codeColor    二维码的颜色
*  @param bgColor      二维码的背景色
*  @param inputMessage 二维码信息
*
*  @return 创建的二维码
*/
- (instancetype)initWithSize:  color:  bgColor:  message: ;
+ (instancetype)gd_codeImageWithSize:  color:  bgColor:  message: ;

```
