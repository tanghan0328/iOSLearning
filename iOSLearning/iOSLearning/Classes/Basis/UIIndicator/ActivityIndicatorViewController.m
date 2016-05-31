//
//  ActivityIndicatorViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/17.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "ActivityIndicatorViewController.h"

@interface ActivityIndicatorViewController ()

@property (nonatomic,retain) UIActivityIndicatorView *activityView;

@end

@implementation ActivityIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithActyIndicator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithActyIndicator
{
    _activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    _activityView.center = CGPointMake(SCREEN_WIDTH/2 - 30, 150);
    _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    _activityView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:_activityView];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 340, 100, 30)];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(onActivityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)onActivityBtnClick:(id)sender
{
    UIButton *button = sender;
    NSString *title = button.titleLabel.text;
    if([title isEqualToString:@"开始"]){
        [button setTitle:@"停止" forState:UIControlStateNormal];
        [_activityView startAnimating];
    }else{
         [button setTitle:@"开始" forState:UIControlStateNormal];
        [_activityView stopAnimating];
    }
    
    NSLog(@"=====button=%@====",title);
}
@end
