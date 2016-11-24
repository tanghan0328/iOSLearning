//
//  TWBlockLoginViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWBlockLoginViewController.h"


@interface TWBlockLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *username;

@end

@implementation TWBlockLoginViewController

- (void)initWhithUsername:(NSString *)username password:(NSString *)password
{
    self.username.text = username;
    self.password.text = password;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.username.text = _usernameText;
    self.password.text = _passwordText;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (IBAction)onBackBtnClick:(id)sender
{
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
