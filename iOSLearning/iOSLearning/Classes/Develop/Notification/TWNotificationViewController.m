//
//  TWNotificationViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/3.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWNotificationViewController.h"
#import "TWNotificationtest01ViewController.h"
#import "NSNotificationCenter+TWRmoveTest.h"

@interface TWNotificationViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation TWNotificationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Show:) name:@"show" object:nil];//一般会在ViewControllerB的init函数中调用

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onNotificationBtnClick:(id)sender
{
   
    
//    //创建一个消息对象
//    NSNotification * notice = [NSNotification notificationWithName:@"wocaocaocaocaocao" object:self userInfo:@{@"1":self.label.text}];
//    //发送消息
//    [[NSNotificationCenter defaultCenter]postNotification:notice object:self];
    
    TWNotificationtest01ViewController *controller = [[TWNotificationtest01ViewController alloc]init];
    
    [self.navigationController pushViewController:controller animated:YES];
    
}

-(void)Show:(NSNotification *)notification{
    NSString *str=(NSString *)[notification object];//这里取出传过来的参数对象@"ShowViewController";
    NSLog(@"show======>>>%@",str);
    
}

@end
