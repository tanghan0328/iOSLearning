//
//  TWBlockTestController.m
//  iOSLearning
//
//  Created by tang on 16/9/21.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWBlockTestController.h"

@interface TWBlockTestController ()

@end

@implementation TWBlockTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    //第一种方法
//    NSString *string = @"Smith";
//    
//    void(^block)() = ^(){
//        NSLog(@"%@",string);
//    };
//    
//    string = @"Jackyson";
//    block();
    
    //第二种方法
//    NSString *string = @"Smith";
//    NSLog(@"1-----string对象：%@,string引用的地址：%p",string,&string);
//    
//    void(^block)() = ^(){
//        NSLog(@"3-----string对象：%@,string引用的地址：%p",string,&string);
//    };
//    
//    string = @"Jackyson";
//    NSLog(@"2-----string对象：%@,string引用的地址：%p",string,&string);
//    block();
    
    //第三种方法  重点是加上了  __block
    __block NSString *string = @"Smith";
    NSLog(@"1-----string对象：%@,string引用的地址：%p",string,&string);
    
    void(^block)() = ^(){
        NSLog(@"3-----string对象：%@,string引用的地址：%p",string,&string);
        string = @"SmithJackyson";
        NSLog(@"4-----string对象：%@,string引用的地址：%p",string,&string);
    };
    
    string = @"Jackyson";
    NSLog(@"2-----string对象：%@,string引用的地址：%p",string,&string);
    block();
    NSLog(@"5-----string对象：%@,string引用的地址：%p",string,&string);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
