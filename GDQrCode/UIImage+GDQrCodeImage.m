//
//  UIImage+GDQrCodeImage.m
//  GDQrCodeExample
//
//  Created by 林广德 on 16/4/24.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "UIImage+GDQrCodeImage.h"

#import "GDQrCodeConst.h"
#import "UIColor+GDQrCode.h"

@implementation UIImage (GDQrCodeImage)
#pragma mark - 创建一个有大小颜色的二维码图片
+ (instancetype)gd_QrCodeImageWithMessage:(NSString *)inputMessage{
    return [[super alloc] initWithMessage:inputMessage];
}
- (instancetype)initWithMessage:(NSString *)inputMessage{
    return [self initWithSize:0 color:nil message:inputMessage];
}

#pragma mark - 创建一个自定义大小的二维码
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size message:(NSString *)inputMessage{
    return [[super alloc] initWithSize:size message:inputMessage];
}
- (instancetype)initWithSize:(CGFloat)size message:(NSString *)inputMessage{
    
    return [self initWithSize:size color:nil message:inputMessage];
}

#pragma mark - 创建一个自定义颜色的二维码
+ (instancetype)gd_QrCodeImageWithColor:(UIColor *)codeColor message:(NSString *)inputMessage{
    return [[super alloc] initWithColor:codeColor message:inputMessage];
}
- (instancetype)initWithColor:(UIColor *)codeColor message:(NSString *)inputMessage{
    return [self initWithSize:0 color:codeColor message:inputMessage];
}

#pragma mark - 创建一个有大小颜色的二维码图片
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size color:(UIColor *)codeColor message:(NSString *)inputMessage{
    return [[super alloc] initWithSize:size color:codeColor message:inputMessage];
}

- (instancetype)initWithSize:(CGFloat)size color:(UIColor *)codeColor message:(NSString *)inputMessage{
    return [self initWithSize:size color:codeColor message:inputMessage centerImage:nil];
}



#pragma mark - 创建一个二维码图片(含有logo)

- (instancetype)initWithMessage:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [self initWithSize:0 message:inputMessage centerImage:centerImage];
}
+ (instancetype)gd_QrCodeImageWithMessage:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [[super alloc] initWithMessage:inputMessage centerImage:centerImage];
}

#pragma mark - 创建一个自定义大小的二维码(含有logo)
- (instancetype)initWithSize:(CGFloat)size message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [self initWithSize:size color:nil message:inputMessage centerImage:centerImage];
}
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [[super alloc] initWithSize:size message:inputMessage centerImage:centerImage];
}


#pragma mark - 创建一个自定义颜色的二维码(含有logo)

- (instancetype)initWithColor:(UIColor *)codeColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [self initWithSize:0 color:codeColor message:inputMessage centerImage:centerImage];
}
+ (instancetype)gd_QrCodeImageWithColor:(UIColor *)codeColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [[super alloc] initWithColor:codeColor message:inputMessage centerImage:centerImage];
}

#pragma mark -  创建一个有大小颜色的二维码图片(含有logo)
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size color:(UIColor *)codeColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [[super alloc] initWithSize:size color:codeColor message:inputMessage centerImage:centerImage];
}
- (instancetype)initWithSize:(CGFloat)size color:(UIColor *)codeColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [self initWithSize:size color:codeColor bgColor:[UIColor whiteColor] message:inputMessage centerImage:centerImage];
}



#pragma mark - 创建一个有颜色 背景色 (含有logo)默认大小
- (instancetype)initWithColor:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [self initWithSize:0 color:codeColor bgColor:bgColor message:inputMessage centerImage:centerImage];
}
+ (instancetype)gd_QrCodeImageWithColor:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [[super alloc] initWithColor:codeColor bgColor:bgColor message:inputMessage centerImage:centerImage];
}


#pragma mark - 创建一个有大小  背景色 (含有logo)默认颜色

- (instancetype)initWithSize:(CGFloat)size bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [self initWithSize:size color:nil bgColor:bgColor message:inputMessage centerImage:centerImage];
}
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [[super alloc] initWithSize:size bgColor:bgColor message:inputMessage centerImage:centerImage];
}


#pragma mark - 创建一个有大小 颜色 背景色 (不含有logo)
- (instancetype)initWithSize:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage{
    return [self initWithSize:size color:codeColor bgColor:bgColor message:inputMessage centerImage:nil];
}
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage{
    return [[super alloc] initWithSize:size color:codeColor bgColor:bgColor message:inputMessage];
}

#pragma mark - 创建一个有大小 颜色 背景色 (含有logo)
+ (instancetype)gd_QrCodeImageWithSize:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    return [[super alloc] initWithSize:size color:codeColor bgColor:bgColor message:inputMessage centerImage:centerImage];
}

- (instancetype)initWithSize:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor message:(NSString *)inputMessage centerImage:(UIImage *)centerImage{
    if (self = [super init]) {
        // 1.创建滤镜
        CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        // 2.还原滤镜默认属性
        [filter setDefaults];
        
        // 3.设置需要生成二维码的数据到滤镜中
        // OC中要求设置的是一个二进制数据
        NSData *data = [inputMessage dataUsingEncoding:NSUTF8StringEncoding];
        [filter setValue:data forKeyPath:@"InputMessage"];
        
        // 4.从滤镜从取出生成好的二维码图片
        CIImage *ciImage = [filter outputImage];
        self = [self createNonInterpolatedUIImageFormCIImage:ciImage size:size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor centerImage:centerImage];
    }
    return self;
}


/**
 *  根据ciImage 创建UIImage并设置大小和颜色
 *
 *  @param ciImage        ciImage
 *  @param widthAndHeight 大小
 *  @param codeColor      颜色
 *
 *  @return UIImage
 */
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)ciImage size:(CGFloat)size color:(UIColor *)codeColor bgColor:(UIColor *)bgColor centerImage:(UIImage *)centerImage{
    size = size>GDCodeSize?size:GDCodeSize;
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
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    
    //    GDColorRGBA rgba = [codeColor getRGBA];
    //    if (rgba.R == 0 && rgba.G == 0 &&rgba.R == 0 && rgba.alpa ==1) {
    //        return [UIImage imageWithCGImage:scaledImage]; // 黑白图片
    //    }
    UIImage *newImage = [UIImage imageWithCGImage:scaledImage];
    //    return newImage;
    return [self imageBlackToTransparent:newImage color:codeColor  bgColor:bgColor centerImage:centerImage];
}

- (UIImage *)addSubImage:(UIImage *)img sub:(UIImage *) subImage{
    //get image width and height
    int w = img.size.width;
    int h = img.size.height;
    int subWidth = subImage.size.width;
    int subHeight = subImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //create a graphic context with CGBitmapContextCreate
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGContextDrawImage(context, CGRectMake( (w-subWidth)/2, (h - subHeight)/2, subWidth, subHeight), [subImage CGImage]);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    UIImage *image=[UIImage imageWithCGImage:imageMasked];
    CGImageRelease(imageMasked);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return image;
    //  CGContextDrawImage(contextRef, CGRectMake(100, 50, 200, 80), [smallImg CGImage]);
}

/**
 *  给二维码图片设置颜色(不用除225.0)
 *
 *  @param image 二维码图片
 *  @param red   红(不用除225.0)
 *  @param green 绿(不用除225.0)
 *  @param blue  蓝(不用除225.0)
 *  @param alpha 透明度 
 *
 *  @return 设置好颜色的二维码
 */

- (UIImage *)imageBlackToTransparent:(UIImage*)image color:(UIColor *)color bgColor:(UIColor *)bgColor centerImage:(UIImage *)centerImage{
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
    if(centerImage)
        return [self addSubImage:resultUIImage sub:centerImage];
    else{
        return resultUIImage;
    }
}

void ProviderReleaseData (void *info, const void *data, size_t size){
    free((void*)data);
}






@end
