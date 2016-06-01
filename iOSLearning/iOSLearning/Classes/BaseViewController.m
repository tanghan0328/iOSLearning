//
//  BaseViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/16.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if(self){
 //       [self setupBackButtonForNavigationBar];
        self.title = title;
        //self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

////加载设置自定义的返回按钮
//- (void)setupBackButtonForNavigationBar
//{
//    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
//    [backButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(onBackButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    self.navigationItem.leftBarButtonItem = item;
//}
//
//- (void)onBackButtonClicked
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

@end
