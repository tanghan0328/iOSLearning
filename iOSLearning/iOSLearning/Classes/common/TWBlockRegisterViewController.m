//
//  TWBlockRegisterViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWBlockRegisterViewController.h"

@interface TWBlockRegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *password;
@end

@implementation TWBlockRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onSureBtnClick:(id)sender
{
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    NSArray *array = [[NSArray alloc]initWithObjects:self.username.text,self.password.text, nil];
    
    if (self.block)
    {
        self.block(array);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendMessage:(returnFirstView)block
{
    self.block = block;
}

@end
