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
        self.view.backgroundColor = [UIColor whiteColor];
 //       [self setupBackButtonForNavigationBar];
        self.title = title;
        self.view.backgroundColor = [UIColor whiteColor];
        
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            //需要遵循一下手势的代理        self.navigationController.interactivePopGestureRecognizer.delegate = self;
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
    }
    return self;
}

- (void)viewDidLoad {
    NSLog(@"是不是所有的人都在这里");
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
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
