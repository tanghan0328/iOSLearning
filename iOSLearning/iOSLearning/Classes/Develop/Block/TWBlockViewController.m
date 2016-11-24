//
//  TWBlockViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWBlockViewController.h"
#import "TWBlockRegisterViewController.h"
#import "TWBlockLoginViewController.h"

@interface TWBlockViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation TWBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)obBlockRegisteBtnClick:(id)sender
{
    TWBlockRegisterViewController *controller = [[TWBlockRegisterViewController alloc]init];
    //直接访问block
//    controller.block = ^(NSArray *array){
//        self.username.text = array[0];
//        self.password.text = array[1];
//    };
//通过方法访问 block
    [controller sendMessage:^(NSArray *array){
        self.username.text = array[0];
        self.password.text = array[1];
    }];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)onBlckLoginBtnClick:(id)sender
{
    //初始化方法直接赋值
    //TWBlockLoginViewController *controller = [[TWBlockLoginViewController alloc]initWhithUsername:self.username.text password:self.password.text];
    TWBlockLoginViewController *controller = [[TWBlockLoginViewController alloc]init];
    //属性赋值
    controller.usernameText = self.username.text;
    controller.passwordText = self.password.text;
    
    [self.navigationController pushViewController:controller animated:YES];
}

@end
