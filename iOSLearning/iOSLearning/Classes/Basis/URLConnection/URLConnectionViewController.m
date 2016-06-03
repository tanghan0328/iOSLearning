//
//  URLConnectionViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "URLConnectionViewController.h"
#import "AFNetworking.h"
#import "NSString+TWJSONToString.h"

@interface URLConnectionViewController ()<NSURLConnectionDataDelegate>

@end

@implementation URLConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self AFNetworkingRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//按钮的点击事件与触动拖拽冲突 可以使用手势代替
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

-(void)AFNetworkingRequest
{
    // 请求的参数
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"20131129", @"date", @"1", @"startRecord", @"5", @"len", @"1234567890", @"udid", @"Iphone", @"terminalType", @"213", @"cid", nil];
    // 初始化Manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误，因为我们要获取text/plain类型数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // post请求
    [manager POST:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?" parameters:dic constructingBodyWithBlock:^(id _Nonnull formData) {
        // 拼接data到请求体，这个block的参数是遵守AFMultipartFormData协议的。
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 这里可以获取到目前的数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        // 请求成功，解析数据
        NSLog(@"%@", responseObject);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"%@", [NSString stringWithCString:[[NSString jsonStringWithDictionary:dic] UTF8String] encoding:NSUnicodeStringEncoding]);
                NSLog(@"%@", [NSString stringWithCString:[[NSString jsonStringWithDictionary:dic] UTF8String] encoding:NSUTF8StringEncoding]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        NSLog(@"%@", [error localizedDescription]);
    }];
}

@end
