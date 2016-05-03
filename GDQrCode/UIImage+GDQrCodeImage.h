//
//  UIImage+GDQrCodeImage.h
//  GDQrCodeExample
//
//  Created by 林广德 on 16/4/24.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIImage (GDQrCodeImage)

/**
 *  创建一个有大小颜色的二维码图片(没有背景色)
 *
 *  @param size         二维码的大小(宽高相等)
 *  @param codeColor    二维码的颜色
 *  @param inputMessage 二维码的内容
 *
 *  @return 返回一个二维码
 */
- (instancetype)initWithSize:(CGFloat)size color:(UIColor *)codeColor message:(NSString *)inputMessage;
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size color:(UIColor *)codeColor message:(NSString *)inputMessage;


/**
 *  创建一个二维码图片(没有背景色)
 *
 *  @param inputMessage 二维码内容
 *
 *  @return 返回一个二维码
 */
- (instancetype)initWithMessage:(NSString *)inputMessage;
+ (instancetype)gd_QrCodeImageWithMessage:(NSString *)inputMessage;

/**
 *  创建一个自定义大小的二维码(没有背景色)
 *
 *  @param size         二维码的大小
 *  @param inputMessage 二维码的内容
 *
 *  @return 返回一个二维码
 */
- (instancetype)initWithSize:(CGFloat)size message:(NSString *)inputMessage;
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size message:(NSString *)inputMessage;

/**
 *  创建一个自定义颜色的二维码(没有背景色)
 *
 *  @param codeColor    二维码的颜色
 *  @param inputMessage 二维码的内容
 *
 *  @return 返回一个二维码
 */
- (instancetype)initWithColor:(UIColor *)codeColor message:(NSString *)inputMessage;
+ (instancetype)gd_QrCodeImageWithColor:(UIColor *)codeColor message:(NSString *)inputMessage;

/**
 *  创建一个有大小颜色的二维码图片(含有logo)(没有背景色)
 *
 *  @param size         二维码的大小(宽高相等)
 *  @param codeColor    二维码的颜色
 *  @param inputMessage 二维码的内容
 *  @param inputMessage 中心图片
 *
 *  @return 返回一个二维码
 */
- (instancetype)initWithSize:(CGFloat)size color:(UIColor *)codeColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size color:(UIColor *)codeColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;

/**
 *  创建一个二维码图片(含有logo)(没有背景色)
 *
 *  @param inputMessage 二维码内容
 *  @param inputMessage 中心图片
 *
 *  @return 返回一个二维码
 */
- (instancetype)initWithMessage:(NSString *)inputMessage centerImage:(UIImage *)centerImage;
+ (instancetype)gd_QrCodeImageWithMessage:(NSString *)inputMessage centerImage:(UIImage *)centerImage;

/**
 *  创建一个自定义大小的二维码(含有logo)(没有背景色)
 *
 *  @param size         二维码的大小
 *  @param inputMessage 二维码的内容
 *  @param inputMessage 中心图片
 *
 *  @return 返回一个二维码
 */
- (instancetype)initWithSize:(CGFloat)size message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;

/**
 *  创建一个自定义颜色的二维码(含有logo)(没有背景色)
 *
 *  @param codeColor    二维码的颜色
 *  @param inputMessage 二维码的内容
 *  @param inputMessage 中心图片
 *
 *  @return 返回一个二维码(没有背景色)
 */
- (instancetype)initWithColor:(UIColor *)codeColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;
+ (instancetype)gd_QrCodeImageWithColor:(UIColor *)codeColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;



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
- (instancetype)initWithSize:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;

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
- (instancetype)initWithColor:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;
+ (instancetype)gd_QrCodeImageWithColor:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;

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
- (instancetype)initWithSize:(CGFloat)size bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage;

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
- (instancetype)initWithSize:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage;
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage;


















@end
