//
//  URLConnectionViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "URLConnectionViewController.h"

@interface URLConnectionViewController ()

@end

@implementation URLConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self post];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self get];
    });
    
}

- (void)post
{
    NSString *urlString = @"http://120.25.226.186:32812/login2";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url];
    
    mutableRequest.HTTPMethod = @"POST";
    mutableRequest.HTTPBody = [@"username=小码哥&pwd=520it" dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSLog(@"=========%@==",mutableRequest);
    [NSURLConnection sendAsynchronousRequest:mutableRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSString *datastring = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"结果为：%@", datastring);
    }];
}

- (void)get
{
    // 0.请求路径
    NSString *urlStr = @"http://120.25.226.186:32812/login2?username=小码哥&pwd=520it";
    // 将中文URL进行转码
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 1.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        // 3.解析服务器返回的数据（解析成字符串）
        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
    }];
}
@end
