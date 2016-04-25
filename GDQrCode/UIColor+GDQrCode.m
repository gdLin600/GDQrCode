//
//  UIColor+GDQrCode.m
//  GDQrCodeExample
//
//  Created by 林广德 on 16/4/24.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "UIColor+GDQrCode.h"
#import <objc/runtime.h>
@implementation UIColor (GDQrCode)
- (GDColorRGBA)getRGBA {
    CGFloat components[3];
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component];
    }
    
    GDColorRGBA rgba = {
        components[0],
        components[1],
        components[2],
        [[self valueForKey:@"alphaComponent"] floatValue] * 255.0
    };
    return rgba;
}







@end
