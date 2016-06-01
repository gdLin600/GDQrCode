//
//  ViewController.m
//  GDQrCodeExample
//
//  Created by 林广德 on 16/4/25.
//  Copyright © 2016年 林广德. All rights reserved.
//

#import "ViewController.h"
#import "GDQrCode.h"
#import "UIImage+GDQRCode.h"
#import "UIImageView+GDQRCode.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) UIImageView *imageV;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, weak) UITableView *t;
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
    UITableView *t = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [t setBackgroundColor:[UIColor redColor]];
    t.dataSource = self;
    t.delegate = self;
    _t = t;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(load)];
    [t addGestureRecognizer:tap];
    [self.view addSubview:t];
    
}

- (void)load{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    [self.imageV gd_setCodeImageWithCodeImageSize:100 centerImage:[UIImage imageNamed:@"icon"] codeMessage:@"2121212243a43a434fa3f4a3s4df3 hfjka hf askjdhjkahkjxcncznczkhcjkzhk askjdhjkahkjxcncznczkhcjkzhk askjdhjkahkjxcncznczkhcjkzhk askjdhjkahkjxcncznczkhcjkzhk askjdhjkahkjxcncznczkhcjkzhk askjdhjkahkjxcncznczkhcjkzhk askjdhjkahkjxcncznczkhcjkzhk"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"CELLID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //    [UIImage gd_QRCodeImageWithQRCodeImageSize:200 qrCodeImageColor:[UIColor whiteColor]  qrCodeBgImageColor:[UIColor blackColor] centerImage:[UIImage imageNamed:@"icon"] codeMessage:@"" completion:^(UIImage *qrCodeImage) {
    //        cell.imageView.image =  qrCodeImage;
    //    }];
    
    [cell.imageView gd_setQRCodeImageWithQRCodeImageSize:200 * 10 qrCodeImageColor:[UIColor whiteColor]  qrCodeBgImageColor:[UIColor blackColor] centerImage:[UIImage imageNamed:@"icon"] placeholderImage:[UIImage imageNamed:@"icon"] codeMessage:@""];
    
    
    //    [cell.imageView gd_setCodeImageWithCodeImageSize:300*10 centerImage:[UIImage imageNamed:@"icon"] codeMessage:@"2121212243a43a434fa3f4a3s4df3"];
    
    //    [UIImage gd_asyncGetQrCodeImageWithSize:1000*10 color:[[UIColor redColor] colorWithAlphaComponent:0.6]message:@"2121212243a43a434fa3f4a3s4df35as4df54asdf54a6s4f5asd45f64as65df4as654fa56s4df534ad54f65fd4a564fd34saf5d64as56f4as65d4f65sa4d65ffffffs4d56s4564dfs65d4f56s4d65f4s56d4f56sd4f564sd56f4s654d65fs4d5f64sd564f56sd4f564ds65f4sd654h" completion:^(UIImage *qrCodeImage) {
    //        cell.imageView.image  = qrCodeImage;
    
    //    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}





@end
