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

/** 票的总数 */
@property (nonatomic, assign) NSInteger ticketCount;

@end

@implementation TWThreadSynchronizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end
