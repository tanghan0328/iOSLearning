//
//  TWButton.m
//  iOSLearning
//
//  Created by tang on 16/12/7.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWButton.h"

@interface  TWButton()

@property (nonatomic, strong) NSTimer *TWtimer;
@property (nonatomic, assign) NSInteger oldTimer;
@property (nonatomic, strong) NSString *frontStr;
@property (nonatomic, strong) NSString *backStr;

@end

@implementation TWButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self sourceInit];
        [self addTimerForMessage];
    }
    return self;
}

- (void)sourceInit
{
    _Timer = 60;
    _normalText = @"获取验证码";
    _oldTimer = _Timer;
    self.frontStr = @"";
    self.backStr = @"";
}

- (void)addTimerForMessage
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(ChangeTimer) userInfo:nil repeats:YES];
    self.TWtimer = timer;
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [self.TWtimer setFireDate:[NSDate distantFuture]];
    [self setTitle:_normalText forState:UIControlStateNormal];
}

- (void)setTimer:(NSInteger)Timer
{
    _Timer = Timer;
    _oldTimer = _Timer;
}

- (void)setNormalText:(NSString *)normalText
{
    _normalText = normalText;
}

- (void)ChangeTimer
{
    if(_Timer >0){
        [self setTitle:[NSString stringWithFormat:@"%@%ld%@",self.frontStr,(long)_Timer,self.backStr] forState:UIControlStateNormal];
        _Timer --;
        
//        [self.TWtimer setFireDate:[NSDate distantPast]];
//        self.userInteractionEnabled = NO;
    }else{
        [self setTitle:self.normalText forState:UIControlStateNormal];
        [self.TWtimer setFireDate:[NSDate distantFuture]];
        self.userInteractionEnabled = YES;
    }
}

-(void)setbuttenfrontTitle:(NSString *)frontstr backtitle:(NSString *)backstr
{
    self.frontStr = frontstr;
    self.backStr = backstr;
}

- (void)sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event
{
    [super sendAction:action to:target forEvent:event];
    [self setTitle:[NSString stringWithFormat:@"%@%ld%@",self.frontStr,_Timer,self.backStr] forState:UIControlStateNormal];
    [self.TWtimer setFireDate:[NSDate distantPast]];
    self.userInteractionEnabled = NO;
}
@end
