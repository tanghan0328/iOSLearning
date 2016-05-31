//
//  DeviceViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/1.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "DeviceViewController.h"

@interface DeviceViewController ()

@end

@implementation DeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithDevice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithDevice
{
    NSMutableString *content = [[NSMutableString alloc]initWithString:@""];
    //设备名称
    NSLog(@"设备名称：%@",[UIDevice currentDevice].name);
    [content appendString: [NSString stringWithFormat:@"%@\n",[UIDevice currentDevice].name ]];
    
    //设备型号，只可得到是何设备，无法得到是第几代设备
    NSLog(@"设备的型号：%@",[UIDevice currentDevice].model) ;
    [content appendString:[NSString stringWithFormat:@"%@\n",[UIDevice currentDevice].model ]];
    //系统版本型号,如iPhone OS
    NSLog(@"系统的版本型号：%@",[UIDevice currentDevice].systemVersion );
    [content appendString:[NSString stringWithFormat:@"%@\n",[UIDevice currentDevice].systemVersion ]];
    //系统版本名称，如6.1.3
    NSLog(@"系统版本名称：%@",[UIDevice currentDevice].systemName);
    [content appendString:[NSString stringWithFormat:@"%@\n",[UIDevice currentDevice].systemName]];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, SCREEN_WIDTH - 40, 200)];
    label.backgroundColor = [UIColor lightGrayColor];
    label.text = content;
    label.numberOfLines = 9;
    [self.view  addSubview:label];
}

@end
