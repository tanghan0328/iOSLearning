//
//  TWUIWebViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/6.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWUIWebViewController.h"

@interface TWUIWebViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation TWUIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWithWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//加载webview
- (void)initWithWebView
{
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    
}

// 开始发送请求（加载数据）时调用这个方法
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"开始加载的时候调用");
}

// 请求完毕（加载数据完毕）时调用这个方法
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"请求完毕后及数据加载完毕后调用这个方法");
}

// 请求错误时调用这个方法
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"请求错误时候调用这个方法");
}

// UIWebView在发送请求之前，都会调用这个方法，如果返回NO，代表停止加载请求，返回YES，代表允许加载请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = [request URL];
    NSLog(@"请求的URL地址：%@",url);
    if ([[url scheme] isEqualToString:@"app"]) {
        if ([[url host] isEqualToString:@"login"]) {
            //后续处理代码
        } else {
            
        }
        return NO;
    }
    return YES;
}

@end
