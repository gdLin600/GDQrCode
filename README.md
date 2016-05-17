# GDQrCode是一个基于 CoreImage 使用UIImage及UIimageView的一个分类来自定义属于自己的二维码

###1.可实现二维码颜色 背景色 自定义
###2.可实现二维码 背景色的透明度的设置
###3.可在二维码中心加图片(logo)

# 不设置背景色时默认背景色为白色
##可以设置颜色的alpha,可使用colorWithAlphaComponent: 及 colorWithRed:green:blue:alpha:来设置alpha

##UIImage的分类实现二维码
### 可自定义大小 颜色 (只能设置颜色的alpha想设置背景色的alpha时可以使用设置背景色的时候设置背景色的alpha)

```objc
/**
*创建一个有大小颜色的二维码图片
*/
- (instancetype)initWithSize:color:message:
+ (instancetype)gd_codeImageWithSize:color:message:

/**
*创建一个二维码图片
*/
- (instancetype)initWithMessage:
+ (instancetype)gd_codeImageWithMessage:

/**
*创建一个自定义大小的二维码
*/
- (instancetype)initWithSize:message:
+ (instancetype)gd_codeImageWithSize:message:

/**
*创建一个自定义颜色的二维码
*/
- (instancetype)initWithColor:message:
+ (instancetype)gd_codeImageWithColor:message:


```


### 可自定义大小 颜色 logo

```objc
/**
*创建一个有大小颜色的二维码图片(含有logo)
*/
- (instancetype)initWithSize:color:message:centerImage
+ (instancetype)gd_codeImageWithSize:color:message:centerImage:

/**
*创建一个二维码图片(含有logo)
*/
- (instancetype)initWithMessage:centerImage:
+ (instancetype)gd_codeImageWithMessage:centerImage:

/**
*创建一个自定义大小的二维码(含有logo)
*/
- (instancetype)initWithSize:message:centerImage:
+ (instancetype)gd_codeImageWithSize:message:centerImage:

/**
*创建一个自定义颜色的二维码(含有logo)
*/
- (instancetype)initWithColor:message:centerImage:
+ (instancetype)gd_codeImageWithColor:message:centerImage:

```



### 可自定义大小 颜色 背景色 logo(可以设置颜色及背景色的alpha)

```objc
/**
*创建一个有大小 颜色 背景色 (含有logo)
*/
- (instancetype)initWithSize:color:bgColor:message:centerImage:
+ (instancetype)gd_codeImageWithSize:color:bgColor:message:centerImage:

/**
*创建一个有颜色 背景色 (含有logo)默认大小
*/
- (instancetype)initWithColor:bgColor:message:centerImage:
+ (instancetype)gd_codeImageWithColor:bgColor:message:centerImage:

/**
*创建一个有大小背景色 (含有logo)默认颜色
*/
- (instancetype)initWithSize:bgColor:message:centerImage:
+ (instancetype)gd_codeImageWithSize:bgColor:message:centerImage:

/**
*创建一个有大小 颜色 背景色 (不含有logo)
*/
- (instancetype)initWithSize:color:bgColor:message:
+ (instancetype)gd_codeImageWithSize:color:bgColor:message:

```


##UIImageView的分类实现二维码

```objc
/**
*  imageview 设置二维码图片
*/
- (void)gd_setCodeImageWithCodeMessage:

- (void)gd_setCodeImageWithCodeImageColor: codeMessage:

- (void)gd_setCodeImageWithCodeImageBdColor: codeMessage:

- (void)gd_setCodeImageWithCodeImageBdColor: codeImageSize: codeMessage:

- (void)gd_setCodeImageWithCodeImageSize: codeMessage:

- (void)gd_setCodeImageWithCodeImageColor: codeImageSize: codeMessage:

- (void)gd_setCodeImageWithCodeImageColor: codeImagebgColor: codeMessage:

- (void)gd_setCodeImageWithCodeImageColor: codeImagebgColor: codeImageSize: codeMessage:

- (void)gd_setCodeImageWithCenterImage: codeMessage:

- (void)gd_setCodeImageWithCodeImageColor: centerImage: codeMessage:

- (void)gd_setCodeImageWithCodeImageBdColor: centerImage: codeMessage:

- (void)gd_setCodeImageWithCodeImageBdColor: codeImageSize: centerImage: codeMessage:

- (void)gd_setCodeImageWithCodeImageSize: centerImage: codeMessage:

- (void)gd_setCodeImageWithCodeImageColor: codeImageSize: centerImage: codeMessage:

- (void)gd_setCodeImageWithCodeImageColor: codeImagebgColor: centerImage: codeMessage:

- (void)gd_setCodeImageWithCodeImageColor: codeImagebgColor: codeImageSize: centerImage: codeMessage:

```












