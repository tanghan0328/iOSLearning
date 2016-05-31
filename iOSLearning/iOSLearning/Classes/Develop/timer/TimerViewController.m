//
//  TimerViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@property (strong, nonatomic) IBOutlet UIButton *perfomerBtn;
@property (strong, nonatomic) IBOutlet UIButton *dispathBtn;
@property (strong, nonatomic) IBOutlet UIButton *timerBtn;
@property (strong, nonatomic) IBOutlet UILabel *hiddenLabel;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onPerformerBtn:(id)sender
{
    self.hiddenLabel.hidden = YES;
    [self performSelector:@selector(hiddenLabelMethod:) withObject:@"123" afterDelay:2.0];
}

-(void)hiddenLabelMethod:(id)sender
{
    NSString *text = (NSString *)sender;
    self.hiddenLabel.hidden = NO;
    NSLog(@"输入的参数=====%@===",text);
}

- (IBAction)onDispathBtnClick:(id)sender
{
    self.hiddenLabel.hidden = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.hiddenLabel.hidden = NO;
    });
}

- (IBAction)onTimerBtnClick:(id)sender
{
    self.hiddenLabel.hidden = YES;
    //NSTimer的正确用法
     NSTimer *timer =  [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(sendBroadcast:)
                                   userInfo:@"hello I'm the info to send"
                                    repeats:NO];

    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)sendBroadcast: (NSTimer *)timer {
    NSString *msg = (NSString *)[timer userInfo];
    NSLog(@"==sendBroadcast  msg==%@=====",msg);
    self.hiddenLabel.hidden = NO;
}
@end
