//
//  TWLoginViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWLoginViewController.h"
#import "TWDelegateViewController.h"

@interface TWLoginViewController ()<NSUserDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation TWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userName.text = _userNameText;
    self.password.text = _passWordText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onBackBtnClick:(id)sender
{
    [self textRegister];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)registerUserName:(NSString *)userName passwrod:(NSString *)password
{
    _userNameText = userName;
    _passWordText = password;
    NSLog(@"测试通知username==》%@，password===>%@",userName,password);
}

- (void)textRegister
{
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
}

@end
