//
//  ProgressViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/31.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "ProgressViewController.h"

@interface ProgressViewController ()
{
    UIProgressView *progressView;
    NSTimer *timer;
    CGFloat progressNumber;
}
@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithProgress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithProgress
{
    progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(20, 120, SCREEN_WIDTH - 40, 60)];
   // progressView.progress = 100.0f;
    progressView.trackTintColor = [UIColor greenColor];
    progressView.progressTintColor = [UIColor redColor];
    [progressView setProgressViewStyle:UIProgressViewStyleDefault];
    [self.view addSubview:progressView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, SCREEN_WIDTH -100, 30)];
    [button setTitle:@"点击进度" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(onProBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)onProBtnClick:(id)sender
{
    if(timer){
        [timer invalidate];
        progressNumber = 0;
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(onTimerChange:) userInfo:nil repeats:YES];
}

- (void)onTimerChange:(id)sender
{
    progressNumber += 1.0f;
    if(progressNumber >= 100.0f){
        [timer invalidate];
    }else{
        [progressView setProgress:progressNumber/100.0f animated:YES];
    }
    NSLog(@"progressNumber = %f",progressNumber);
}

@end
