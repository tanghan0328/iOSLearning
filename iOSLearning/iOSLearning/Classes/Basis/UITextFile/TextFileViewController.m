//
//  TextFileViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/16.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TextFileViewController.h"

#define NUMBERSPERIOD @"0123456789"

@interface TextFileViewController ()<UITextFieldDelegate>

@end

@implementation TextFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithTextFile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithTextFile
{
    UITextField *textFirst =[[UITextField alloc]initWithFrame:CGRectMake(30, 100, 200, 30)];
    textFirst.placeholder = @"请输入用户名";
    textFirst.backgroundColor = [UIColor lightGrayColor];
    textFirst.font = [UIFont systemFontOfSize:13.0];
    textFirst.keyboardType = UIKeyboardTypePhonePad;
    textFirst.returnKeyType = UIReturnKeyNext;
    textFirst.delegate = self;
    //设置borderStyle
    textFirst.borderStyle = UITextBorderStyleLine;
    
    UITextField *textSecond =[[UITextField alloc]initWithFrame:CGRectMake(30, 160, 200, 30)];
    textSecond.placeholder = @"请输入密码";
    textSecond.font = [UIFont boldSystemFontOfSize:13.0];
    textSecond.textColor = [UIColor redColor];
    textSecond.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    textSecond.returnKeyType = UIReturnKeyNext;
    //设置密码的方式  隐藏输入
    textSecond.secureTextEntry = YES;
    textSecond.delegate = self;
    //设置清楚标记的X出现的方式
    textSecond.clearButtonMode = UITextFieldViewModeAlways;
    
    UITextField *textThrid =[[UITextField alloc]initWithFrame:CGRectMake(30, 220, 200, 30)];
    textThrid.placeholder = @"请输入重复密码";
    textThrid.keyboardType =  UIKeyboardTypeEmailAddress;
    textThrid.returnKeyType = UIReturnKeyDone;
    //只有borderStyle 设置为None的时候才能这样设置背景
    textThrid.borderStyle = UITextBorderStyleNone;
    textThrid.background = [UIImage imageNamed:@"Img_default@2x"];
    textThrid.delegate = self;
    
    UITextField *textForth =[[UITextField alloc]initWithFrame:CGRectMake(30, 280, 200, 30)];
    textForth.placeholder = @"请输入用户名";
    textForth.keyboardType = UIKeyboardTypeURL;
    textForth.returnKeyType = UIReturnKeyYahoo;
    //设置背景图片
    textForth.disabledBackground = [UIImage imageNamed:@"Image_set@3x"];
    textForth.delegate = self;
    
    [self.view addSubview:textFirst];
    [self.view addSubview:textSecond];
    [self.view addSubview:textThrid];
    [self.view addSubview:textForth];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERSPERIOD ] invertedSet]; //invertedSet 方法是去反字符,把所有的除了数字的字符都找出来
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    //componentsSeparatedByCharactersInSet 方法是把输入框输入的字符string 根据cs中字符一个一个去除cs字符并分割成单字符并转化为 NSArray, 然后componentsJoinedByString 是把NSArray 的字符通过 ""无间隔连接成一个NSString字符 赋给filtered.就是只剩数字了.
    
    
    BOOL basicTest = [string isEqualToString:filtered];
    if(!basicTest)
        
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"请输入数字"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        
        [alert show];
        return NO;
    }
    return basicTest;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

@end
