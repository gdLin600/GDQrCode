//
//  ViewController.m
//  GDQrCodeExample
//
//  Created by 林广德 on 16/4/25.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "ViewController.h"
#import "GDQrCode.h"
@interface ViewController ()
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
    [self.imageV setImage:[UIImage gd_codeImageWithMessage:@"https://github.com/gdLin600/GDQrCode.git"]];
}
@end
