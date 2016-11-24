//
//  TWDelegateViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWDelegateViewController.h"
#import "TWLoginViewController.h"
#import "TWRegisteViewController.h"

@interface TWDelegateViewController ()<UITextFieldDelegate,RegisterDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation TWDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//点击注册按钮
- (IBAction)onRegisterBtnClick:(id)sender {
    TWRegisteViewController *controller = [[TWRegisteViewController alloc]init];
    controller.delegate = self;
    [self.navigationController pushViewController:controller animated:YES];
}

//点击登录
- (IBAction)onLoginBtnClick:(id)sender
{
    TWLoginViewController *controller = [[TWLoginViewController alloc]init];
    self.delegate = controller;
    if(self.delegate && [self.delegate respondsToSelector:@selector(registerUserName:passwrod:)]){
        [self.delegate registerUserName:self.userName.text  passwrod:self.password.text];
    }
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == _userName){
        [_userName resignFirstResponder];
        [_password becomeFirstResponder];
    }
}

- (void)sendUserName:(NSString *)userName password:(NSString *)password
{
    self.userName.text = userName;
    self.password.text = password;
}

@end
