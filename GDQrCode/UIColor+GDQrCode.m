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
    CGFloat r=0,g=0,b=0,a=0;
    
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self getRed:&r green:&g blue:&b alpha:&a];
    }else {
        const CGFloat *components = CGColorGetComponents(self.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    GDColorRGBA rgba = {r,g,b,a};
    return rgba;
    /*CGFloat components[4];
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
     components[3]
     //        [[self valueForKey:@"alphaComponent"] floatValue] * 255.0
     };
     return rgba;*/
}







@end
