//
//  TWThreadSynchronizeViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/22.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWThreadSynchronizeViewController.h"

@interface TWThreadSynchronizeViewController ()
/** 售票员01 */
@property (nonatomic, strong) NSThread *thread01;
/** 售票员02 */
@property (nonatomic, strong) NSThread *thread02;
/** 售票员03 */
@property (nonatomic, strong) NSThread *thread03;
//设置线程
@property (nonatomic, strong) NSThread *thread04;
/** 票的总数 */
@property (nonatomic, assign) NSInteger ticketCount;

@end

@implementation TWThreadSynchronizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testDemo1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
//    if(self.thread01 == nil){
        self.thread01 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
        self.thread01.name = @"售票员01";
//    }
//
//    if(self.thread02 == nil){
        self.thread02 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
        self.thread02.name = @"售票员02";
//    }
    
//    if(self.thread03 == nil){
        self.thread03 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
        self.thread03.name = @"售票员03";
//    }
    self.ticketCount = 100;
    [self.thread01 start];
    [self.thread02 start];
    [self.thread03 start];
    
}

- (void)saleTicket
{
    while (1) {
        @synchronized(self) {
            // 先取出总数
            NSInteger count = self.ticketCount;
            if (count > 0) {
                self.ticketCount = count - 1;
                NSLog(@"%@卖了一张票，还剩下%zd张===>%@", [NSThread currentThread].name, self.ticketCount,[NSThread currentThread]);
            } else {
                NSLog(@"票已经卖完了");
                break;
            }
        }
    }
}

- (void)testDemo1
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"线程开始");
        //获取到当前线程
        self.thread04 = [NSThread currentThread];
        
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        //添加一个Port，同理为了防止runloop没事干直接退出
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        
        //运行一个runloop，[NSDate distantFuture]：很久很久以后才让它失效
        [runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
        NSLog(@"线程结束");
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //在我们开启的异步线程调用方法
        [self performSelector:@selector(recieveMsg) onThread:self.thread04 withObject:nil waitUntilDone:NO];
    });
}

- (void)recieveMsg
{
    NSLog(@"收到消息了，在这个线程：%@",[NSThread currentThread]);
}

@end
