//
//  TWRegisteViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWRegisteViewController.h"

@interface TWRegisteViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation TWRegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onRegisterBtnClick:(id)sender {
    [self textRegister];
    if(self.delegate && [self.delegate respondsToSelector:@selector(sendUserName:password:)]){
        [self.delegate sendUserName:self.userName.text password:self.password.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)textRegister
{
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
}

@end
