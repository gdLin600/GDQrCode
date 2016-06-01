//
//  UIImageView+GDQRCode.h
//  GDQrCodeExample
//
//  Created by 林广德 on 16/6/2.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (GDQRCode)

- (void)gd_setQRCodeImageWithQRCodeImageSize:(CGFloat)qrCodeSize qrCodeImageColor:(UIColor *)qrCodeImageColor qrCodeBgImageColor:(UIColor *)qrCodeBgImageColor centerImage:(UIImage *) centerImage placeholderImage:(UIImage *)placeholderImage codeMessage:(NSString *)codeMessage;


- (void)gd_setQRCodeImageWithQRCodeImageSize:(CGFloat)qrCodeSize qrCodeImageColor:(UIColor *)qrCodeImageColor qrCodeBgImageColor:(UIColor *)qrCodeBgImageColor centerImage:(UIImage *) centerImage codeMessage:(NSString *)codeMessage;

@end
