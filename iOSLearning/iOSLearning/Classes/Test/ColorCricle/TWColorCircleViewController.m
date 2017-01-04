//
//  TWColorCircleViewController.m
//  iOSLearning
//
//  Created by tang on 17/1/4.
//  Copyright © 2017年 tang. All rights reserved.
//参考了 https://github.com/FTCcheV/LineAndCircleScaleView 这个地址的作者东西，谢谢

#import "TWColorCircleViewController.h"
#import "TWScaleView.h"

@interface TWColorCircleViewController ()

@end

@implementation TWColorCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    TWScaleView *scaleView = [[TWScaleView alloc]initWithFrame:CGRectMake(10, 150, SCREEN_WIDTH - 20, 27)];
    scaleView.maxValue = 10000;
    scaleView.currentValue = 8000;
    scaleView.bgView.backgroundColor = PNmidGray;
    scaleView.scaleView.backgroundColor = PNFreshGreen;
    [self.view addSubview:scaleView];
    
    UILabel *currentLabel = [[UILabel alloc]initWithFrame:CGRectMake((CGRectGetWidth(scaleView.frame)-160)/2, (CGRectGetHeight(scaleView.frame) - 24)/2, 160, 24)];
    currentLabel.backgroundColor = [UIColor clearColor];
    currentLabel.text = @"可用额度：8000";
    currentLabel.textColor = [UIColor whiteColor];
    currentLabel.font = [UIFont systemFontOfSize:16];
    currentLabel.textAlignment = NSTextAlignmentCenter;
    [scaleView addSubview:currentLabel];
    
    UILabel *allLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 175, CGRectGetMaxY(scaleView.frame)+15, 160, 24)];
    allLabel.backgroundColor = [UIColor whiteColor];
    allLabel.text = @"总额度：10000";
    allLabel.textAlignment = NSTextAlignmentRight;
    allLabel.font = [UIFont systemFontOfSize:16];
    allLabel.textColor = TextColor;
    [self.view addSubview:allLabel];
    
    UIView *tableLine = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(allLabel.frame)+50, SCREEN_WIDTH - 20, 0.6)];
    tableLine.backgroundColor = tableLineColor;
    [self.view addSubview:tableLine];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
