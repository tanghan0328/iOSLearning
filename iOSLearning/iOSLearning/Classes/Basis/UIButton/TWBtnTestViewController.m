//
//  TWBtnTestViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/3.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWBtnTestViewController.h"

@interface TWBtnTestViewController ()

@end

@implementation TWBtnTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试模态的跳转";
    [self.view setBackgroundColor:[UIColor yellowColor]];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT -64)];
    imageView.image =[UIImage imageWithColor:[UIColor redColor]];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
