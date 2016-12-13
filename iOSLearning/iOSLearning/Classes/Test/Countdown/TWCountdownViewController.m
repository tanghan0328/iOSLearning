//
//  TWCountdownViewController.m
//  iOSLearning
//
//  Created by tang on 16/12/7.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWCountdownViewController.h"
#import "TWButton.h"

@interface TWCountdownViewController ()

@end

@implementation TWCountdownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TWButton *button = [[TWButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-100, 100, 200, 40)];
    [button setNormalText:@"点击获取验证码"];
    [button setTimer:60];
    [button setbuttenfrontTitle:@"倒计时" backtitle:@"秒"];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)BtnClick:(id)sender
{
    NSLog(@"我曹测试");
    
    //注册一个runloop一直在运行
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    [loop run];
}



@end
