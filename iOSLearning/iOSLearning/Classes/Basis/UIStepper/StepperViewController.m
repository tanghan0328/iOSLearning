//
//  StepperViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/31.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "StepperViewController.h"

@interface StepperViewController ()

@property (nonatomic,retain)UILabel *label;
@end

@implementation StepperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithStepper];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithStepper
{
    UIStepper *stepper = [[UIStepper alloc]initWithFrame:CGRectMake(120, 120, 60 , 60)];
    stepper.autorepeat = YES;
    stepper.continuous = YES;
    stepper.minimumValue = 0;
    stepper.maximumValue = 100;
    stepper.value = 50;
    stepper.stepValue = 10;
    
    [stepper addTarget:self action:@selector(onStepperClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:stepper];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(120, 180, 60, 30)];
    _label.backgroundColor = [UIColor lightGrayColor];
    _label.text = [NSString  stringWithFormat:@"%.2f", stepper.value];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}

- (void)onStepperClick:(id)sender
{
    UIStepper *step = sender;
    _label.text =[NSString stringWithFormat:@"%.2f",step.value];
}

@end
