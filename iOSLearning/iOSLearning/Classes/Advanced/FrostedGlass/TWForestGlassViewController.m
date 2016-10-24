//
//  TWForestGlassViewController.m
//  iOSLearning
//
//  Created by tang on 16/10/24.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWForestGlassViewController.h"
#import "UIImageView+LBBlurredImage.h"


@interface TWForestGlassViewController ()

@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation TWForestGlassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_imageView];
    _imageView.image = [UIImage imageNamed:@"example.jpg"];
    [self.imageView setImageToBlur:[UIImage imageNamed:@"example.jpg"]
                        blurRadius:kLBBlurredImageDefaultBlurRadius
                   completionBlock:^(){
                       NSLog(@"The blurred image has been set");
                   }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
