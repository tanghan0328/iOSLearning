//
//  TWSunnyViewController.m
//  iOSLearning
//
//  Created by tang on 16/11/24.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWSunnyViewController.h"
#import "TWSon.h"
#import "TWFather.h"

@interface TWSunnyViewController ()<NSURLSessionDelegate>

typedef NSString*(^WXYTestBlock)(NSString *name,int age);

@property (nonatomic, strong) UILabel *label;

@end

@implementation TWSunnyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    WXYTestBlock myBlock = ^ (NSString *name, int age){
        return [NSString stringWithFormat:@"%@的年龄是%d",name,age];
    };
    
    TWLog(@"独立block--->%@", myBlock(@"小宇", 16));
    
    
    TWSon *son = [[TWSon alloc]init];
    
//    [self getWithsharedSessionGet];
//    [self postWithSharedSession];
    
    [self sessionDataDelegate];
    
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH - 40, 100)];
    _label.backgroundColor = [UIColor lightGrayColor];
    _label.text = @"测试信息";
    _label.textColor  = [UIColor blackColor];
    [self.view addSubview:_label];
    
    
//    TWFather *father = [TWFather new];
//    
//    BOOL b1  = [father respondsToSelector:@selector(respondsToSelector:)];
//    BOOL b2 = [TWFather respondsToSelector:@selector(respondsToSelector:)];
//    NSLog(@"%d, %d", b1, b2);
    
//    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5);
//    UIView *view = [[UIView alloc] initWithFrame:frame];
//    view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view];

    
//    NSLog(@"1");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"2");
//    });
//    NSLog(@"3");
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *  简单 GET 请求
 */
- (void)getWithsharedSessionGet
{
    // 获取默认 Session
    NSURLSession *session = [NSURLSession sharedSession];
    // 创建 URL
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/s?wd=test"];
    // 创建任务 task
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 获取数据后解析并输出
        NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        dataStr = [dataStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"get方法为：===》%@",dataStr);
        dispatch_async(dispatch_get_main_queue(), ^{
            _label.text = dataStr;
            _label.font = [UIFont systemFontOfSize:11.0f];
            [_label setTextColor:[UIColor darkGrayColor]];
            [_label setTintColor:[UIColor purpleColor]];
        });
    }];
    // 启动任务
    [task resume];
}

/**
 *  简单 Post 请求，POST 和 GET 请求在于对 request 的处理不同，其余和 GET 相同
 */
- (void)postWithSharedSession
{
    // 获取默认 Session
    NSURLSession *session = [NSURLSession sharedSession];
    // 创建 URL
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login"];
    // 创建 request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 请求方法
    request.HTTPMethod = @"POST";
    // 请求体
    request.HTTPBody = [@"username=1234&pwd=4321" dataUsingEncoding:NSUTF8StringEncoding];
    // 创建任务 task
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 获取数据后解析并输出
        
//        NSData *dataA = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

        NSLog(@"post方法的返回值为：===》%@",dataStr);
    }];
    // 启动任务
    [task resume];
}
//创建有代理的session
- (void)sessionDataDelegate
{
    // 创建带有代理方法的自定义 session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 创建任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://120.25.226.186:32812/login?username=1234&pwd=4321"]]];
    
    // 启动任务
    [task resume];
}

#pragma mark -
#pragma mark - NSURLSessionDelegate

// 1. 接收到服务器的响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    NSLog(@"接收到服务器的响应");
    // 必须设置对响应进行允许处理才会执行后面两个操作。
    completionHandler(NSURLSessionResponseAllow);
}

// 2. 接收到服务器的数据（可能调用多次）
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    // 处理每次接收的数据
    NSLog(@"接受到服务器的数据%s",__func__);
}

// 3. 请求成功或者失败（如果失败，error有值）
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    // 请求完成,成功或者失败的处理
    NSLog(@"SessionTask %s",__func__);
}

//该方法为UIView中的方法

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.view.isUserInteractionEnabled || self.view.isHidden || self.view.alpha <= 0.01) {
        return nil;
    }
    if ([self.view pointInside:point withEvent:event]) {
        for (UIView *subview in [self.view.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subview convertPoint:point fromView:self.view];
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        return self.view;
    }
    return nil;
}

@end
