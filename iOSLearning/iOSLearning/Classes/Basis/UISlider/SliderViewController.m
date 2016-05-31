//
//  SliderViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/17.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "SliderViewController.h"
#import "MySlidersView.h"
#import "MySliderView.h"

@interface SliderViewController ()

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithSilder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithSilder
{
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(100, 100, 150, 50)];
    slider.minimumValue = 0;
    slider.maximumValue = 10;
    slider.continuous = NO;
    slider.backgroundColor = [UIColor greenColor];
    
    UISlider *selfSliser = [[UISlider alloc]initWithFrame:CGRectMake(100, 280, 150, 55)];
    selfSliser.minimumValueImage = [UIImage imageNamed:@"btn_more@2x"];
    selfSliser.maximumValueImage = [UIImage imageNamed:@"btn_more@3x"];
    selfSliser.continuous = YES;
    selfSliser.minimumValue = 0;
    selfSliser.maximumValue = 5;
    
    selfSliser.minimumTrackTintColor = [UIColor greenColor];
    selfSliser.maximumTrackTintColor = [UIColor redColor];
    
    [selfSliser setThumbImage:[UIImage imageNamed:@"btn_more"] forState:UIControlStateNormal];
   // selfSliser.thumbTintColor = [UIColor blueColor];
    
//    [selfSliser setMinimumTrackImage:[UIImage imageNamed:@"min.png"] forState:UIControlStateNormal];
//    
//    [selfSliser setMaximumTrackImage:[UIImage imageNamed:@"max.png"] forState:UIControlStateNormal];
    
    [selfSliser addTarget:self action:@selector(onSliderSlider:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    [self.view addSubview:selfSliser];
    
    //自定义的滑动条
    MySlidersView *sliderView = [[MySlidersView alloc]initWithFrame:CGRectMake(50, 360, 247, 55)];
    [self.view setUserInteractionEnabled:YES];
    [self.view addSubview:sliderView];
    
//    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(hanldeView:)];
//    self.view.userInteractionEnabled = YES;
//    [self.view addGestureRecognizer:panRecognizer];
    
    MySliderView *slider2 = [[MySliderView alloc]initWithFrame:CGRectMake(50, 420, 247, 55)];
    [self.view addSubview:slider2];
    
}

- (void)onSliderSlider:(id)sender
{
    UISlider *slider = sender;
    
    NSLog(@"===slider.value ===%f==",slider.value);
}

- (void)hanldeView:(id)sender
{
    NSLog(@"&&&&&&&&hanldeView&&&&&&");
}
@end
