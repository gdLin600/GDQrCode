//
//  UIImage+GDQRCode.m
//  GDQrCodeExample
//
//  Created by 林广德 on 16/6/1.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "UIImage+GDQRCode.h"
#import "UIColor+GDQrCode.h"

const CGFloat GDCodeMINSize = 256;
const CGFloat GDCodeMAXSize = 800;

@implementation UIImage (GDQRCode)
- (instancetype)roundedCornerImageWithCornerRadius:(CGFloat)cornerRadius {
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    if (cornerRadius < 0)
        cornerRadius = 0;
    else if (cornerRadius > MIN(w, h))
        cornerRadius = MIN(w, h) / 2.;
    UIImage *image = nil;
    CGRect imageFrame = CGRectMake(0., 0., w, h);
    UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:cornerRadius] addClip];
    [self drawInRect:imageFrame];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (void)gd_QRCodeImageWithQRCodeImageSize:(CGFloat)qrCodeSize qrCodeImageColor:(UIColor *)qrCodeImageColor qrCodeBgImageColor:(UIColor *)qrCodeBgImageColor centerImage:(UIImage *)centerImage codeMessage:(NSString *)codeMessage completion:(void (^)(UIImage *))completion{
    
    // 1.创建滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2.还原滤镜默认属性
    [filter setDefaults];
    
    // 3.设置需要生成二维码的数据到滤镜中
    // OC中要求设置的是一个二进制数据
    NSData *data = [codeMessage dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    
    [self createNonInterpolatedUIImageFormCIImage:[filter outputImage] size:qrCodeSize color:qrCodeImageColor bgColor:qrCodeBgImageColor centerImage:centerImage completion:completion];
    
}


+ (void)createNonInterpolatedUIImageFormCIImage:(CIImage *)ciImage size:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor centerImage:(UIImage *)centerImage completion:(void (^)(UIImage *))completion{
    size = size <= GDCodeMINSize ? GDCodeMINSize : size >= GDCodeMAXSize ? GDCodeMAXSize : size;
    
    CGRect extentRect = CGRectIntegral(ciImage.extent);
    CGFloat scale = MIN(size / CGRectGetWidth(extentRect), size / CGRectGetHeight(extentRect));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extentRect) * scale;
    size_t height = CGRectGetHeight(extentRect) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef bitmapImage = [context createCGImage:ciImage fromRect:extentRect];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extentRect, bitmapImage);
    
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    
    GDColorRGBA rgba = [codeColor getRGBA];
    GDColorRGBA gdrgba = [bgColor getRGBA];
    if (rgba.R == 255.0 && rgba.G == 255.0 &&rgba.R == 255.0 && rgba.alpa == 255.0 && gdrgba.R == 0 && gdrgba.G == 0 &&gdrgba.R == 0 && gdrgba.alpa == 255.0 ) {
        if(centerImage) {
            [self addSubImage:[UIImage imageWithCGImage:scaledImage] sub:centerImage completion:completion];
            return;
        }
        if (completion) {
            completion([UIImage imageWithCGImage:scaledImage]);
        }
        return; // 黑白图片
    }
    UIImage *newImage = [UIImage imageWithCGImage:scaledImage];
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    CGColorSpaceRelease(cs);
    CGImageRelease(scaledImage);
    [self imageBlackToTransparent:newImage color:codeColor bgColor:bgColor centerImage:centerImage completion:completion];
}

void ProviderReleaseData (void *info, const void *data, size_t size){
    free((void*)data);
}
+ (void)imageBlackToTransparent:(UIImage*)image color:(UIColor *)color bgColor:(UIColor *)bgColor centerImage:(UIImage *)centerImage completion:(void (^)(UIImage *))completion{
    //可获取rgb和alpha
    color = color ? color:[UIColor blackColor];
    bgColor = bgColor ? bgColor : [UIColor whiteColor];
    GDColorRGBA colorRgba = [color getRGBA];
    
    GDColorRGBA bgColorRgba = [bgColor getRGBA];
    
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t      bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    // 遍历像素
    int pixelNum = imageWidth * imageHeight;
    uint32_t* pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++){
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900){ // 设置二维码的颜色及透明度
            // 改成下面的代码，会将图片转成想要的颜色
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[3] = colorRgba.R; //0~255
            ptr[2] = colorRgba.G;
            ptr[1] = colorRgba.B;
            ptr[0] = colorRgba.alpa;
        }else {//二维码的背景颜色
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[3] = bgColorRgba.R; //0~255
            ptr[2] = bgColorRgba.G;
            ptr[1] = bgColorRgba.B;
            ptr[0] = bgColorRgba.alpa;
        }
    }
    // 输出图片
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        NULL, true, kCGRenderingIntentDefault);
    
    CGDataProviderRelease(dataProvider);
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    // 清理空间
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    if(centerImage) {
        [self addSubImage:resultUIImage sub:centerImage completion:completion];
        return;
    }
    
    if (completion) {
        completion(resultUIImage);
    }
}


+ (void)addSubImage:(UIImage *)img sub:(UIImage *) subImage completion:(void (^)(UIImage *))completion{
    int w = img.size.width;
    int h = img.size.height;
    int subWidth = subImage.size.width;
    int subHeight = subImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGContextDrawImage(context, CGRectMake( (w-subWidth)/2, (h - subHeight)/2, subWidth, subHeight), [subImage CGImage]);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    UIImage *image=[UIImage imageWithCGImage:imageMasked];
    CGImageRelease(imageMasked);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    if (completion) {
        completion(image);
    }
}


@end
