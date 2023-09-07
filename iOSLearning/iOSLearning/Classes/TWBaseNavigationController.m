//
//  TWBaseNavigationController.m
//  iOSLearning
//
//  Created by tang tang on 2023/9/7.
//  Copyright © 2023 tang. All rights reserved.
//

#import "TWBaseNavigationController.h"

@interface TWBaseNavigationController ()

@end

@implementation TWBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = YES;
    self.navigationBar.hidden = YES;
}

- (void)setBarClear{
    [self.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    
}
- (void)setBackgroundImage:(UIImage*)bI shadowImage: (UIImage*)sI{
    [self.navigationBar setBackgroundImage:bI
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = sI;
}


@end
