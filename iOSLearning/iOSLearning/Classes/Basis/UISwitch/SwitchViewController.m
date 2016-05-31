//
//  SwitchViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/17.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "SwitchViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithSwitch];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithSwitch
{
    UISwitch *switchV = [[UISwitch alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    switchV.on = YES;
    
    UISwitch *switchView = [[UISwitch alloc]initWithFrame:CGRectMake(100, 180, 100, 30)];
    //打开的颜色
   // switchView.onTintColor = [UIColor redColor];
    switchView.on = YES;
    switchView.offImage = [UIImage imageNamed:@"btn_close_danmu"];//无效
    switchView.onImage = [UIImage imageNamed:@"btn_clock@2x"];
    //边框的颜色
   // switchView.tintColor = [UIColor greenColor];
    
    [switchView addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:switchV];
    [self.view addSubview:switchView];
}

- (void)switchChange:(id)sender
{
    UISwitch *switchValue = sender;
    
    if(switchValue.isOn){
        NSLog(@"打开");
    }else{
        NSLog(@"关闭");
    }
    NSLog(@"switchValue==switchChange====");
}
@end
