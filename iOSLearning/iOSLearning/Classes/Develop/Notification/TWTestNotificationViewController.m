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

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noticeTest:) name:@"wocaocaocaocaocao" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)noticeTest:(NSNotification *)sender
{
    NSLog(@"通知的消息%@",sender);
}

@end
