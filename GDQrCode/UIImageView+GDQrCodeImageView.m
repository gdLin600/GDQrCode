//
//  UIImageView+GDQrCodeImageView.m
//  GDQrCodeExample
//
//  Created by 林广德 on 16/5/17.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "UIImageView+GDQrCodeImageView.h"
#import "UIImage+GDQrCodeImage.h"
@implementation UIImageView (GDQrCodeImageView)

- (void)gd_setCodeImageWithCodeMessage:(NSString *)codeMessage{
    [self gd_setCodeImageWithCodeImageSize:0 codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeMessage:(NSString *)codeMessage{
    [self gd_setCodeImageWithCodeImageColor:codeColor codeImageSize:0 codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageBdColor:(UIColor *)bgColor codeMessage:(NSString *)codeMessage{
    [self gd_setCodeImageWithCodeImageBdColor:bgColor codeImageSize:0 codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageBdColor:(UIColor *)bgColor codeImageSize:(CGFloat)size codeMessage:(NSString *)codeMessage{
    [self gd_setCodeImageWithCodeImageColor:nil codeImagebgColor:bgColor codeImageSize:size codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageSize:(CGFloat)size codeMessage:(NSString *)codeMessage{
    [self gd_setCodeImageWithCodeImageColor:nil codeImageSize:size codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImageSize:(CGFloat)size codeMessage:(NSString *)codeMessage{
    [self gd_setCodeImageWithCodeImageColor:codeColor codeImagebgColor:nil codeImageSize:size codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImagebgColor:(UIColor *)bgColor codeMessage:(NSString *)codeMessage{
    [self gd_setCodeImageWithCodeImageColor:codeColor codeImagebgColor:bgColor codeImageSize:0 codeMessage:codeMessage];
}


- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImagebgColor:(UIColor *)bgColor codeImageSize:(CGFloat)size codeMessage:(NSString *)codeMessage{
    [self gd_setCodeImageWithCodeImageColor:codeColor codeImagebgColor:bgColor codeImageSize:size centerImage:nil codeMessage:codeMessage];
}


#pragma mark - 带有logo
- (void)gd_setCodeImageWithCenterImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage {
    [self gd_setCodeImageWithCodeImageColor:nil centerImage:centerImage codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage {
    [self gd_setCodeImageWithCodeImageColor:codeColor codeImagebgColor:nil centerImage:centerImage codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageBdColor:(UIColor *)bgColor centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage {
    [self gd_setCodeImageWithCodeImageColor:nil codeImagebgColor:bgColor centerImage:centerImage codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageBdColor:(UIColor *)bgColor codeImageSize:(CGFloat)size centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage {
    [self gd_setCodeImageWithCodeImageColor:nil codeImagebgColor:bgColor codeImageSize:size centerImage:centerImage codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageSize:(CGFloat)size centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage {
    [self gd_setCodeImageWithCodeImageColor:nil codeImageSize:size centerImage:centerImage codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImageSize:(CGFloat)size centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage {
    [self gd_setCodeImageWithCodeImageColor:codeColor codeImagebgColor:nil codeImageSize:size centerImage:centerImage codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImagebgColor:(UIColor *)bgColor centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage {
    [self gd_setCodeImageWithCodeImageColor:codeColor codeImagebgColor:bgColor codeImageSize:0 centerImage:centerImage codeMessage:codeMessage];
}

- (void)gd_setCodeImageWithCodeImageColor:(UIColor *)codeColor codeImagebgColor:(UIColor *)bgColor codeImageSize:(CGFloat)size centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [UIImage gd_QrCodeImageWithSize:size color:codeColor bgColor:bgColor message:codeMessage centerImage:centerImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = nil;
            [self setImage:image];
        });
    });
    
}






@end
