//
//  UIImage+GDQRCode.h
//  GDQrCodeExample
//
//  Created by 林广德 on 16/6/1.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GDQRCode)
/**
 *  图片设置圆角
 *
 *  @param cornerRadius 圆角的半径
 *
 *  @return 转化为圆角的图片
 */
- (instancetype)roundedCornerImageWithCornerRadius:(CGFloat)cornerRadius;

+ (void)gd_QRCodeImageWithQRCodeImageSize:(CGFloat)qrCodeSize qrCodeImageColor:(UIColor *)qrCodeImageColor qrCodeBgImageColor:(UIColor *)qrCodeBgImageColor centerImage:(UIImage *) centerImage codeMessage:(NSString *)codeMessage completion:(void (^)(UIImage *qrCodeImage))completion;



@end
