//
//  TWNotificationtest01ViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/7.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWNotificationtest01ViewController.h"
#import "TWTestNotificationViewController.h"

@interface TWNotificationtest01ViewController ()

@end

@implementation TWNotificationtest01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Show222:) name:@"show" object:nil];//一般会在ViewControllerB的init函数中调用
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onjumpBtnClick:(id)sender {
    TWTestNotificationViewController *controller = [[TWTestNotificationViewController alloc]init];
    
    [self.navigationController pushViewController:controller animated:YES];
    
}


-(void)Show222:(NSNotification *)notification{
    NSString *str=(NSString *)[notification object];//这里取出传过来的参数对象@"ShowViewController";
    NSLog(@"Show222=======》%@",str);
    
}

@end
