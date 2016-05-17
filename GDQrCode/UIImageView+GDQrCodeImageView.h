//
//  UIImageView+GDQrCodeImageView.h
//  GDQrCodeExample
//
//  Created by 林广德 on 16/5/17.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (GDQrCodeImageView)
/**
 *  imageview 设置二维码图片
 *
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param codeColor   二维码的颜色
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param bgColor     二维码背景图片
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageBdColor:(UIColor *)bgColor codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param bgColor     二维码背景图片
 *  @param size        二维码图片的大小
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageBdColor:(UIColor *)bgColor codeImageSize:(CGFloat)size codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param size        二维码图片的大小
 *  @param codeMessage 二维码内容
 */
- (void)gd_setCodeImageWithCodeImageSize:(CGFloat)size codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param codeColor   二维码的颜色
 *  @param size        二维码图片的大小
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImageSize:(CGFloat)size codeMessage:(NSString *)codeMessage;

- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImagebgColor:(UIColor *)bgColor codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param codeColor   二维码的颜色
 *  @param bgColor     二维码的背景颜色
 *  @param size        二维码的大小
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImagebgColor:(UIColor *)bgColor codeImageSize:(CGFloat)size codeMessage:(NSString *)codeMessage;


#pragma mark - 带有logo

/**
 *  imageview 设置二维码图片
 *
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCenterImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param codeColor   二维码的颜色
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param bgColor     二维码背景图片
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageBdColor:(UIColor *)bgColor centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param bgColor     二维码背景图片
 *  @param size        二维码图片的大小
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageBdColor:(UIColor *)bgColor codeImageSize:(CGFloat)size centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param size        二维码图片的大小
 *  @param codeMessage 二维码内容
 */
- (void)gd_setCodeImageWithCodeImageSize:(CGFloat)size centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param codeColor   二维码的颜色
 *  @param size        二维码图片的大小
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImageSize:(CGFloat)size centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage;

- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImagebgColor:(UIColor *)bgColor centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage;

/**
 *  imageview 设置二维码图片
 *
 *  @param codeColor   二维码的颜色
 *  @param bgColor     二维码的背景颜色
 *  @param size        二维码的大小
 *  @param codeMessage 二维码的内容
 */
- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImagebgColor:(UIColor *)bgColor codeImageSize:(CGFloat)size centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage;



@end
