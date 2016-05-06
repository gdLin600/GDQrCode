//
//  ViewController.m
//  GDQrCodeExample
//
//  Created by 林广德 on 16/4/25.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "ViewController.h"
#import "GDQrCode.h"
@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, weak) UIImageView *imageV;
@end

@implementation ViewController

- (UIImageView *)imageV
{
    if (!_imageV) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageV = imageView;
        imageView.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
        [self.view addSubview:imageView];
        
    }
    return _imageV;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImage *qr = [UIImage gd_QrCodeImageWithColor:[UIColor colorWithRed:0.6 green:0.3 blue:0.2 alpha:0.8] message:@"https://github.com/gdLin600/GDQrCode"];
    [self.imageV setImage:qr];
    //    UIImageWriteToSavedPhotosAlbum(qr, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    UIImagePickerController *imageV = [[UIImagePickerController alloc] init];
    imageV.delegate = self;
    imageV.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imageV animated:YES completion:nil];
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    [[GDQrCodeScanner shareScanner] gd_giveMeQrCodeImage:image completion:^(NSString *qrCodeMessage, NSError *error) {
        NSLog(@"%@------%@",qrCodeMessage,error);
    }];
}

@end
