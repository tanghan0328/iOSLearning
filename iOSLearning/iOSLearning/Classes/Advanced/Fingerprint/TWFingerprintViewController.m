//
//  TWFingerprintViewController.m
//  iOSLearning
//
//  Created by tang on 16/11/22.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWFingerprintViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface TWFingerprintViewController ()

@end

@implementation TWFingerprintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //系统支持，最低iOS 8.0
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
    {
        LAContext * context = [[LAContext alloc] init];
        NSError * error;
        if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
        {
            
            //localizedReason: 指纹识别出现时的提示文字
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
                
                if (success)
                {
                    //识别成功
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //在主线程中，处理 ......
                    });
                }
                else if (error)
                {
                    NSLog(@"LAPolicyDeviceOwnerAuthenticationWithBiometrics -- %@",error);
                }
                
            }];
            
        }
        else if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:nil])
        {
            [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"密码解锁" reply:^(BOOL success, NSError * _Nullable error){
                
                NSLog(@"LAPolicyDeviceOwnerAuthentication -- %@", error);
                
            }];
        }
        NSLog(@" --- %@ ", error);
    }
}

@end
