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

static NSString *AA1 =@"ceshiaaa";

@interface TWSunnyViewController ()<NSURLSessionDelegate>

typedef NSString*(^WXYTestBlock)(NSString *name,int age);

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) dispatch_group_t disGroup;
@property (nonatomic, strong) NSString *AA;

@end

@implementation TWSunnyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _AA = @"ceshibbbb";
    
    WXYTestBlock myBlock = ^ (NSString *name, int age){
        return [NSString stringWithFormat:@"%@的年龄是%d",name,age];
    };
    
    TWLog(@"独立block--->%@", myBlock(@"小宇", 16));
    
    [self eatA];
    [self eatB];
    [self eatC];
    [self eatD];
    [self testBlock];
    _disGroup = dispatch_group_create();
    [self requestDatas];
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
//int类型的不会变化  因为是常量
- (void)eatA
{
    int a = 3;
    void (^myBlock)(int b)  = ^(int b){
        b= 6;
        NSLog(@"测试商品eatA=111111==》%d",a);
    };
    myBlock(a);
    NSLog(@"测试商品eatA===》%d",a);
}
//NSString类型的不会变化
- (void)eatB
{
    NSString *a = @"哈哈哈abc";
    NSLog(@"测试字符串的长度===>%lu",(unsigned long)a.length);
    void (^myBlock)(NSString  *b)  = ^(NSString *b){
        b= @"abc";
        NSLog(@"测试商品===》%@",b);
        NSLog(@"测试字符串的长度11111===>%lu",(unsigned long)b.length);
    };
    
    myBlock(a);
    NSLog(@"测试商品1111===》%@",a);
}
//数组类型的会变化  why 找找原因吧
- (void)eatC
{
    NSMutableArray *a = [NSMutableArray arrayWithObject:@"1111"];
    NSMutableArray *(^myBlock)(NSMutableArray  *b)  = ^(NSMutableArray *b){
        NSString *c= @"abc";
        [b addObject:c];
        NSLog(@"测试商品===》%@",b);
        return b;
    };
    
    myBlock(a);
    NSLog(@"测试商品1111===》%@",a);
}

- (void)eatD
{
    NSString *aa = @"a.b";
    NSLog(@"sssss===>%@",aa);
    NSString *ss = @"a b";
    NSLog(@"sssss111===>%@",ss);
    NSString *kk = @"a@b";
    NSLog(@"sssss222===>%@",kk);
    NSString *mm = @"1a@b";
    NSLog(@"sssss333===>%@",mm);
}

- (void)requestDatas {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(self.disGroup);
    dispatch_group_enter(self.disGroup);
    dispatch_group_enter(self.disGroup);
    
    dispatch_group_async(self.disGroup, queue, ^{
        [self requestHomeWorks];
    });
    
    dispatch_group_async(self.disGroup, queue, ^{
        [self requestHomeBanner];
    });
    
    dispatch_group_async(self.disGroup, queue, ^{
        [self requestHomeAdvInfos];
    });
    
    dispatch_group_notify(self.disGroup, dispatch_get_main_queue(), ^{
        NSLog(@"4");
    });
}

- (void)requestHomeWorks {
   [UIView animateWithDuration:0.1F animations:^{
       NSLog(@"1");
       dispatch_group_leave(self.disGroup);
   }];
}

- (void) requestHomeBanner {
    [UIView animateWithDuration:0.1F animations:^{
        NSLog(@"2");
        dispatch_group_leave(self.disGroup);
    }];
}

- (void) requestHomeAdvInfos {
    [UIView animateWithDuration:0.1F animations:^{
        NSLog(@"3");
        dispatch_group_leave(self.disGroup);
    }];
}
NSString *AA5 = @"ceshiAAAA9";//全局变量
//测试block的问题
- (void)testBlock
{
    NSString *AA2 =@"111";
    static NSString *AA3 = @"dddd";
    __block NSString *AA4 = @"ggg";
    
    NSLog(@"测试的testBlock11111=_AA==》%@=====&=》%p", _AA, &_AA);
    NSLog(@"测试的testBlock11111=AA1==》%@=====&=》%p", AA1, &AA1);
    NSLog(@"测试的testBlock11111==AA2=》%@=====&=》%p", AA2, &AA2);
    NSLog(@"测试的testBlock11111==AA3=》%@=====&=》%p", AA3,&AA3);
    NSLog(@"测试的testBlock11111==AA4=》%@=====&=》%p", AA4,&AA4);
    NSLog(@"测试的testBlock11111==AA5=》%@=====&=》%p", AA5,&AA5);
    
    void (^myBLockA)(NSString *a) = ^(NSString *a)
    {
        _AA = @"6666";
        AA1 = @"7777";
        AA5 = @"0000";
//        AA2= @"";
        a = @"222";
        AA3 = @"ffff";
        AA4 = @"ppppp";
        
        NSLog(@"测试的testBlock22222=_AA==》%@=====&=》%p", _AA, &_AA);
        NSLog(@"测试的testBlock22222=AA1==》%@=====&=》%p", AA1, &AA1);
        NSLog(@"测试的testBlock22222==aaa=》%@=====&=》%p", a, &a);
        NSLog(@"测试的testBlock22222==AA2=》%@=====&=》%p", AA2, &AA2);
        NSLog(@"测试的testBlock22222==AA3=》%@=====&=》%p", AA3,&AA3);
        NSLog(@"测试的testBlock22222==AA4=》%@=====&=》%p", AA4,&AA4);
        NSLog(@"测试的testBlock22222==AA5=》%@=====&=》%p", AA5,&AA5);

    };
    myBLockA(AA2);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"测试的testBlock33333=_AA==》%@=====&=》%p", _AA, &_AA);
        NSLog(@"测试的testBlock33333=AA1==》%@=====&=》%p", AA1, &AA1);
        NSLog(@"测试的testBlock33333==AA2=》%@=====&=》%p", AA2, &AA2);
        NSLog(@"测试的testBlock33333==AA3=》%@=====&=》%p", AA3,&AA3);
        NSLog(@"测试的testBlock33333==AA4=》%@=====&=》%p", AA4,&AA4);
        NSLog(@"测试的testBlock55555==AA5=》%@=====&=》%p", AA5,&AA5);

//    });

}
@end
