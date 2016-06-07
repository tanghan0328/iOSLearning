//
//  TWTestNotificationViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/3.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWTestNotificationViewController.h"

@interface TWTestNotificationViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation TWTestNotificationViewController

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:@"show" object:nil];//一般会在ViewControllerB的dealloc中调用
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"show" object:@"ShowViewController"];
    NSLog(@"到了这里执行了吗？");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"测试通知");
    self.label.text = @"测试看看";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
