//
//  GDQrCodeScanner.m
//  GDQrCodeExample
//
//  Created by 林广德 on 16/5/4.
//  Copyright © 2016年 林广德. All rights reserved.
// 

#import "GDQrCodeScanner.h"
#import <AVFoundation/AVFoundation.h>
@interface GDQrCodeScanner ()<AVCaptureMetadataOutputObjectsDelegate>{
    completionBlock _completionBlock;
}
@property ( strong , nonatomic ) AVCaptureDevice * device;
@property ( strong , nonatomic ) AVCaptureDeviceInput * input;
@property ( strong , nonatomic ) AVCaptureMetadataOutput * output;
@property ( strong , nonatomic ) AVCaptureSession * session;
@property ( strong , nonatomic ) AVCaptureVideoPreviewLayer * previewLayer;


/*** 专门用于保存描边的图层 ***/
@property (nonatomic,strong) CALayer *containerLayer;
@property (nonatomic, weak) UIView *scannerContainerView;
@property (nonatomic, weak) UIView *scannerView;

@end

@implementation GDQrCodeScanner
singleton_implementationstatic;

#pragma mark -------- 懒加载---------
- (AVCaptureDevice *)device
{
    if (!_device ) {
        _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    return _device;
}

- (AVCaptureDeviceInput *)input
{
    if (!_input) {
        _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    }
    return _input;
}

- (AVCaptureSession *)session
{
    if (!_session ) {
        _session = [[AVCaptureSession alloc] init];
    }
    return _session;
}

- (AVCaptureVideoPreviewLayer *)previewLayer
{
    if (!_previewLayer) {
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
    }
    return _previewLayer;
}
// 设置输出对象解析数据时感兴趣的范围
// 默认值是 CGRect(x: 0, y: 0, width: 1, height: 1)
// 通过对这个值的观察, 我们发现传入的是比例
// 注意: 参照是以横屏的左上角作为, 而不是以竖屏
//        out.rectOfInterest = CGRect(x: 0, y: 0, width: 0.5, height: 0.5)
- (AVCaptureMetadataOutput *)output
{
    if (!_output ) {
        _output = [[AVCaptureMetadataOutput alloc] init];
        
        // 1.获取屏幕的frame
        CGRect viewRect = self.scannerView.frame;
        // 2.获取扫描容器的frame
        CGRect containerRect = self.scannerContainerView.frame;
        
        CGFloat x = containerRect.origin.y / viewRect.size.height;
        CGFloat y = containerRect.origin.x / viewRect.size.width;
        CGFloat width = containerRect.size.height / viewRect.size.height;
        CGFloat height = containerRect.size.width / viewRect.size.width;
        
        // CGRect outRect = CGRectMake(x, y, width, height);
        // [_output rectForMetadataOutputRectOfInterest:outRect];
        _output.rectOfInterest = CGRectMake(x, y, width, height);
    }
    return _output;
}

- (CALayer *)containerLayer
{
    if (!_containerLayer) {
        _containerLayer = [[CALayer alloc] init];
    }
    return _containerLayer;
}


+ (instancetype)gd_QrCodeScannerWithScannerView:(UIView *)scannerView scannerContainerView:(UIView *)scannerContainerView completion:(completionBlock)completion{
    return [[super alloc] initWithScannerView:scannerView scannerContainerView:scannerContainerView completion:completion];
}
- (instancetype)initWithScannerView:(UIView *)scannerView scannerContainerView:(UIView *)scannerContainerView completion:(completionBlock)completion{
    if (self = [super init]) {
        _completionBlock = completion;
        self.scannerView = scannerView;
        self.scannerContainerView = scannerContainerView;
        [self createSession];
        //开始扫描
        [self gd_startScanner];
    }
    return self;
}

- (void)gd_giveMeScannerView:(UIView *)scannerView scannerContainerView:(UIView *)scannerContainerView completion:(void (^)(NSString *qrCodeMessage,NSError *error))completion{
    _completionBlock = completion;
    self.scannerView = scannerView;
    self.scannerContainerView = scannerContainerView;
    [self createSession];
    // 开始扫描
    [self gd_startScanner];
}


- (void)gd_startScanner{
    [self.session startRunning];
    
}

- (void)gd_stopScanner{
    [self.session stopRunning];
}

/**
 *  初始化session
 */
- (void)createSession{
    // 1.判断输入能否添加到会话中
    if (![self.session canAddInput:self.input]) return;
    [self.session addInput:self.input];
    
    
    // 2.判断输出能够添加到会话中
    if (![self.session canAddOutput:self.output]) return;
    [self.session addOutput:self.output];
    
    // 4.设置输出能够解析的数据类型
    // 注意点: 设置数据类型一定要在输出对象添加到会话之后才能设置
    self.output.metadataObjectTypes = self.output.availableMetadataObjectTypes;
    
    // 5.设置监听监听输出解析到的数据
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // 6.添加预览图层
    [self.scannerView.layer insertSublayer:self.previewLayer atIndex:0];
    self.previewLayer.frame = self.scannerView.bounds;
    
    // 7.添加容器图层
    [self.scannerView.layer addSublayer:self.containerLayer];
    self.containerLayer.frame = self.scannerView.bounds;
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    // id 类型不能点语法,所以要先去取出数组中对象
    AVMetadataMachineReadableCodeObject *object = [metadataObjects lastObject];
    if (object == nil) return;
    // 只要扫描到结果就会调用
    if(_completionBlock){
        _completionBlock(object.stringValue,nil);
    }
    // 清除之前的描边
    [self clearLayers];
    
    // 对扫描到的二维码进行描边
    AVMetadataMachineReadableCodeObject *obj = (AVMetadataMachineReadableCodeObject *)[self.previewLayer transformedMetadataObjectForMetadataObject:object];
    
    // 绘制描边
    [self drawLine:obj];
}
- (void)clearLayers
{
    if (self.containerLayer.sublayers)
    {
        for (CALayer *subLayer in self.containerLayer.sublayers)
        {
            [subLayer removeFromSuperlayer];
        }
    }
}
- (void)drawLine:(AVMetadataMachineReadableCodeObject *)objc
{
    NSArray *array = objc.corners;
    
    // 1.创建形状图层, 用于保存绘制的矩形
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    
    // 设置线宽
    layer.lineWidth = 2;
    // 设置描边颜色
    layer.strokeColor = [UIColor greenColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    
    // 2.创建UIBezierPath, 绘制矩形
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGPoint point = CGPointZero;
    int index = 0;
    
    CFDictionaryRef dict = (__bridge CFDictionaryRef)(array[index++]);
    // 把点转换为不可变字典
    // 把字典转换为点，存在point里，成功返回true 其他false
    CGPointMakeWithDictionaryRepresentation(dict, &point);
    
    // 设置起点
    [path moveToPoint:point];
    
    // 2.2连接其它线段
    for (int i = 1; i<array.count; i++) {
        CGPointMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)array[i], &point);
        [path addLineToPoint:point];
    }
    // 2.3关闭路径
    [path closePath];
    
    layer.path = path.CGPath;
    // 3.将用于保存矩形的图层添加到界面上
    [self.containerLayer addSublayer:layer];
}

- (void)gd_giveMeQrCodeImage:(UIImage *)qrCodeImage completion:(completionBlock)completion{
    
    NSString *content = @"" ;
    NSError *err = nil;
    if (!qrCodeImage) {
        err = [NSError errorWithDomain:@"你还没有给我一个图片" code:404 userInfo:nil];
        completion(content,err);
    }
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode
                            
                                              context:[CIContext contextWithOptions:nil]
                            
                                              options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    
    NSArray *features = [detector featuresInImage:[[CIImage alloc] initWithImage:qrCodeImage]];
    if (features.count) {
        for (CIFeature *feature in features) {
            
            if ([feature isKindOfClass:[CIQRCodeFeature class]]) {
                
                content = ((CIQRCodeFeature *)feature).messageString;
                break;
            }
        }
    } else {
        err = [NSError errorWithDomain:@"未正常解析二维码图片, 请确保iphone5/5c以上的设备" code:404 userInfo:nil];
    }
    if (completion) {
        completion(content,err);
    }
}





@end
