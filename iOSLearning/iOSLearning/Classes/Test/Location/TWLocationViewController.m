//
//  TWLocationViewController.m
//  iOSLearning
//
//  Created by tang on 16/12/29.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWLocationViewController.h"
#import "TWLocationUpdateManager.h"

@interface TWLocationViewController ()

@end

@implementation TWLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[TWLocationUpdateManager sharedStandardManager]startStandardUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
