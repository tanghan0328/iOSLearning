//
//  TWPThreadViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/22.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWPThreadViewController.h"
#import <pthread.h>

@interface TWPThreadViewController ()

@end

@implementation TWPThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createThread2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//原始的pthread方法
- (IBAction)onPthreadClick:(id)sender {
    pthread_t pthread;
    pthread_create(&pthread, NULL, run, NULL);
}

void * run(void *param)
{
    for (NSInteger i = 0; i<50000; i++) {
        NSLog(@"------buttonClick---%zd--%@", i, [NSThread currentThread]);
    }
    return NULL;
}

//线程
- (IBAction)onThreadClick:(id)sender {
    
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadMthod:) object:@"jack"];
    thread.name = @"my-thread";
    [thread start];
}

- (void)threadMthod:(NSString *)param
{
    //让线程睡眠2秒（阻塞2秒）
    [NSThread sleepForTimeInterval:2.0f];
    //NSDate *distantPast = [NSDate distantPast];          //  可以表示的最早的时间
    //NSDate *distantFuture = [NSDate distantFuture];      //  可以表示的最远的未来时间
    [NSThread sleepUntilDate:[NSDate distantFuture]];
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    for (NSInteger i = 0; i<100; i++) {
        NSLog(@"-----run-----%@--%@", param, [NSThread currentThread]);
        if(i == 99){
            //强制停止线程
            [NSThread exit];
        }
    }
}

- (void)createThread2
{
    //[NSThread detachNewThreadSelector:@selector(threadMthod:) toTarget:self withObject:@"rose"];
    //隐式创建并启动线程
//    [self performSelectorInBackground:@selector(threadMthod:) withObject:@"rose"];
//    //在主线程中执行
//    [self performSelectorOnMainThread:@selector(threadMthod:) withObject:@"rose" waitUntilDone:YES];
}
@end
