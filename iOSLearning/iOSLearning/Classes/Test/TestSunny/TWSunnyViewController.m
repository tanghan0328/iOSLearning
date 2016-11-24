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

@interface TWSunnyViewController ()

typedef NSString*(^WXYTestBlock)(NSString *name,int age);

@end

@implementation TWSunnyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    WXYTestBlock myBlock = ^ (NSString *name, int age){
        return [NSString stringWithFormat:@"%@的年龄是%d",name,age];
    };
    
    TWLog(@"独立block--->%@", myBlock(@"小宇", 16));
    
    
    TWSon *son = [[TWSon alloc]init];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





@end
