//
//  GDQrCodeScanner.h
//  GDQrCodeExample
//
//  Created by 林广德 on 16/5/4.
//  Copyright © 2016年 林广德. All rights reserved.
// 二维码扫描枪

#import <UIKit/UIKit.h>
#define singleton_interface \
+ (instancetype)shareScanner;
#define singleton_implementation\
static GDQrCodeScanner *instance_;\
+ (instancetype)shareScanner{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance_ = [[GDQrCodeScanner alloc] init];\
});\
return instance_;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance_ = [super allocWithZone:zone];\
});\
return instance_;\
}\
- (id)copyWithZone:(NSZone *)zone{\
return instance_;\
}

typedef void (^completionBlock) (NSString *qrCodeMessage,NSError *error);

@interface GDQrCodeScanner : NSObject
singleton_interface;
/**
 *  二维码扫描枪
 *
 *  @param scannerView          扫描框的父控件
 *  @param scannerContainerView 扫描框
 *  @param completion           扫描的结果
 *
 */
+ (instancetype)gd_QrCodeScannerWithScannerView:(UIView *)scannerView scannerContainerView:(UIView *)scannerContainerView completion:(completionBlock)completion;
- (instancetype)initWithScannerView:(UIView *)scannerView scannerContainerView:(UIView *)scannerContainerView completion:(completionBlock)completion;

/**
 *  使用二维码扫描枪扫描二维码
 *
 *  @param scannerView          扫描框的父控件
 *  @param scannerContainerView 扫描框
 *  @param completion           扫描的结果
 */
- (void)gd_giveMeScannerView:(UIView *)scannerView scannerContainerView:(UIView *)scannerContainerView completion:(completionBlock)completion;

/**
 *  扫描图片的二维码
 *
 *  @param qrCodeImage 需要扫描的二维码图片
 *  @param completion  扫描结果
 */
- (void)gd_giveMeQrCodeImage:(UIImage *)qrCodeImage completion:(completionBlock)completion;

/**
 *  开启扫描(默认就是开始状态)
 */
- (void)gd_startScanner;
/**
 *  关闭扫描
 */
- (void)gd_stopScanner;



@end
