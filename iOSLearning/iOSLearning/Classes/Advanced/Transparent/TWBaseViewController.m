//
//  TWBaseViewController.m
//  iOSLearning
//
//  Created by tang on 16/9/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWBaseViewController.h"

@interface TWBaseViewController ()

@end

@implementation TWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//        NSArray *list = self.navigationController.navigationBar.subviews;
//        for (id obj in list) {
//            if ([obj isKindOfClass:[UIImageView class]]) {
//                UIImageView *imageView = (UIImageView *)obj;
//                NSArray *list2 = imageView.subviews;
//                for (id obj2 in list2) {
//                    if ([obj2 isKindOfClass:[UIImageView class]]) {
//                        UIImageView *imageView2 = (UIImageView *)obj2;
//                        imageView2.hidden = YES;
//                    }
//                }
//            }
//        }
//    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
