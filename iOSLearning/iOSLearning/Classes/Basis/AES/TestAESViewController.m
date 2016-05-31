//
//  TestAESViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/1.
//  Copyright © 2016年 tang. All rights reserved.
//
#import "NSString+AES.h"
#import "TestAESViewController.h"

@interface TestAESViewController ()

@end

@implementation TestAESViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //字符串加密
    NSString *key = @"12345678";//Key是和后台约定的key哦，不然无法解密....
    
    NSString *secret = @"aes Bison base64";
    
    
    NSLog(@"字符串加密---%@",[secret AES256_Encrypt:key]);
    
    //字符串解密
    NSLog(@"字符串解密---%@",[[secret AES256_Encrypt:key] AES256_Decrypt:key]);
    
    
    //NSData加密+base64
    
    NSData *plain = [secret dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *cipher = [plain AES256_Encrypt:key];
    
    NSLog(@"NSData加密+base64++++%@",[cipher newStringInBase64FromData]);
    
    //解密
    
    plain = [cipher AES256_Decrypt:key];
    
    NSLog(@"NSData解密+base64++++%@", [[NSString alloc] initWithData:plain encoding:NSUTF8StringEncoding]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
