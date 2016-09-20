//
//  TWSnakeViewController.m
//  iOSLearning
//
//  Created by tang on 16/9/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWSnakeViewController.h"
#import "TWSnake.h"

@interface TWSnakeViewController ()

@end

@implementation TWSnakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    id cls = [TWSnake class];
//    id cls1 = [TWSnake class];
    void *obj = &cls;
    [(__bridge id)obj speak];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
