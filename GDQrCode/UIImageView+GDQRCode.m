//
//  UIImageView+GDQRCode.m
//  GDQrCodeExample
//
//  Created by 林广德 on 16/6/2.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "UIImageView+GDQRCode.h"
#import "UIImage+GDQRCode.h"
@implementation UIImageView (GDQRCode)
- (void)gd_setQRCodeImageWithQRCodeImageSize:(CGFloat)qrCodeSize qrCodeImageColor:(UIColor *)qrCodeImageColor qrCodeBgImageColor:(UIColor *)qrCodeBgImageColor centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage{
    [self gd_setQRCodeImageWithQRCodeImageSize:qrCodeSize qrCodeImageColor:qrCodeImageColor qrCodeBgImageColor:qrCodeBgImageColor centerImage:centerImage placeholderImage:nil codeMessage:codeMessage];
}

- (void)gd_setQRCodeImageWithQRCodeImageSize:(CGFloat)qrCodeSize qrCodeImageColor:(UIColor *)qrCodeImageColor qrCodeBgImageColor:(UIColor *)qrCodeBgImageColor centerImage:(UIImage *)centerImage placeholderImage:(UIImage *)placeholderImage codeMessage:(NSString *)codeMessage{
    
    if (placeholderImage) {
        self.image = placeholderImage;
    }
    __unsafe_unretained typeof(self)weakSelf = self;
    [UIImage gd_QRCodeImageWithQRCodeImageSize:qrCodeSize qrCodeImageColor:qrCodeImageColor qrCodeBgImageColor:qrCodeBgImageColor centerImage:centerImage codeMessage:codeMessage completion:^(UIImage *qrCodeImage) {
        weakSelf.image = qrCodeImage;
    }];
}
@end
