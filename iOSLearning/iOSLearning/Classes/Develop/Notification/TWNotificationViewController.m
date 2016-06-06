//
//  TWNotificationViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/3.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWNotificationViewController.h"
#import "TWTestNotificationViewController.h"

@interface TWNotificationViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation TWNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text = @"测试看看";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onNotificationBtnClick:(id)sender
{
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"wocaocaocaocaocao" object:nil userInfo:@{@"1":self.label.text}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
    
    TWTestNotificationViewController *controller = [[TWTestNotificationViewController alloc]init];
    
    [self.navigationController pushViewController:controller animated:YES];
    
}


@end
