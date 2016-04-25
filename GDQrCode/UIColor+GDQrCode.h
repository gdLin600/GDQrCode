//
//  UIColor+GDQrCode.h
//  GDQrCodeExample
//
//  Created by 林广德 on 16/4/24.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef struct  {
    CGFloat R;
    CGFloat G;
    CGFloat B;
    CGFloat alpa;
}GDColorRGBA;
@interface UIColor (GDQrCode)
#pragma mark - 获取颜色的rgb
- (GDColorRGBA)getRGBA;
@end
