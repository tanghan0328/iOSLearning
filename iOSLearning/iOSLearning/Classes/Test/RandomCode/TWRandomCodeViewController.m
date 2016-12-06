//
//  TWRandomCodeViewController.m
//  iOSLearning
//
//  Created by tang on 16/12/6.
//  Copyright © 2016年 tang. All rights reserved.
//
//生成随机数的验证码

#import "TWRandomCodeViewController.h"
#import "TWRandomCodeView.h"


@interface TWRandomCodeViewController ()

@property (nonatomic, strong) TWRandomCodeView *codeImageView;

@end

@implementation TWRandomCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _codeImageView = [[TWRandomCodeView alloc] initWithFrame:CGRectMake(100, 100, 80, 35)];
    _codeImageView.bolck = ^(NSString *imageCodeStr){//看情况是否需要
        NSLog(@"imageCodeStr = %@",imageCodeStr);
    };
    _codeImageView.isRotation = NO;
    [_codeImageView freshVerCode];
    //点击刷新
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [_codeImageView addGestureRecognizer:tap];
    [self.view addSubview: _codeImageView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, 150, 40)];
    [button setTitle:@"测试按钮跳转" forState:UIControlStateNormal];
    [button setTintColor:[UIColor redColor]];
    [button addTarget:self action:@selector(onRedButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
}

- (void)onRedButtonClick:(UIButton *)btn
{
    NSURL *url = [NSURL URLWithString:@"test://more"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }else{
        NSLog(@"没有安装应用");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)tapClick:(UITapGestureRecognizer*)tap
{
    [_codeImageView freshVerCode];
}

@end
