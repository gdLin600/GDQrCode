//
//  GDQrCodeScanner.h
//  GDQrCodeExample
//
//  Created by 林广德 on 16/5/4.
//  Copyright © 2016年 林广德. All rights reserved.
// 二维码扫描枪

#import <UIKit/UIKit.h>

@interface GDQrCodeScanner : NSObject
//TODO: 此功能不可用测试
#warning 使用二维码时可讲此类删除
+ (instancetype)gd_QrCodeScannerWithScannerView:(UIView *)scannerView scannerContainerView:(UIView *)scannerContainerView completion:(void (^)(NSString *qrCodeMessage,NSError *error))completion;
- (instancetype)initWithScannerView:(UIView *)scannerView scannerContainerView:(UIView *)scannerContainerView completion:(void (^)(NSString *qrCodeMessage,NSError *error))completion;


@end
