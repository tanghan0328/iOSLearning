//
//  TWPDFReaderViewController.m
//  iOSLearning
//
//  Created by tang on 16/5/19.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWPDFReaderViewController.h"

@interface TWPDFReaderViewController()<WKScriptMessageHandler,WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, retain) WKWebView* webView;
@property (nonatomic, retain) NSString *requestURL;

@end

@implementation TWPDFReaderViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupBackButtonForNavigationBar];
    }
    return self;
}


-(void)initWebView
{
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    [configuration.userContentController addScriptMessageHandler:self name:@"Redirect"];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    _webView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_webView];
}

- (void)loadWebViewWidthURL
{
    NSURL *url = [NSURL URLWithString:_requestURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    [self initWebView];
    self.requestURL = @"http://ei.51fapiao.cn:9080/51ptProxy/fpxz?p=TJHTFP20160512122794";
    if (_requestURL != nil) {
        [self loadWebViewWidthURL];
    }
}

- (void)setupBackButtonForNavigationBar
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
    [backButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(onBackButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _webView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onBackButtonClicked
{
    if([_webView canGoBack]){
        [_webView goBack];
    }
}

#pragma mark -- WKNavigationDelegate

//准备加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"start");
}

//页面开始返回
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    NSLog(@"webView Load commit");
}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSLog(@"webView Load finish");
    // UIImage *image = nil;
    [_webView evaluateJavaScript:@"document.getElementsByTagName('img')[0].src;" completionHandler:^(id Result, NSError * error) {
        
        NSLog(@"js___Result==%@",Result);
        NSLog(@"js___Error -> %@", error);
        
    }];
    
    //UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    //    CGContextSaveGState(context);
    //[self.view drawViewHierarchyInRect:self.view.bounds afterScreenUpdates:YES];
    //image = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

//加载失败
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"webView Load Error %@", error);
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"webView Load Error %@", error);
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"didReceiveServerRedirectForProvisionalNavigation");
}

#pragma mark -- WKUIDelegate

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler();
                                                      }]];
    
    [self presentViewController:alertController animated:YES completion:^{}];
    
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler(YES);
                                                      }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action){
                                                          completionHandler(NO);
                                                      }]];
    
    [self presentViewController:alertController animated:YES completion:^{}];
    
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = defaultText;
    }];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *input = ((UITextField *)alertController.textFields.firstObject).text;
        completionHandler(input);
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        completionHandler(nil);
    }]];
    [alertController.view setNeedsLayout];
    [self presentViewController:alertController animated:YES completion:^{}];
    
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
}
@end