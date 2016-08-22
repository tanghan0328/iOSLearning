//
//  TWKVOViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/23.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWKVOViewController.h"

@interface TWKVOViewController ()

@property (nonatomic, retain)TWStudent *student;

@end

@implementation TWKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _student = [[TWStudent alloc]init];
    _student.name = @"tangwei";
    _student.age = 30;
    [_student addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(changeStudentAgeValue:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //移除观察者
    [_student removeObserver:self forKeyPath:@"age"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)changeStudentAgeValue:(UIButton *)btn
{
    _student.age++;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"age"] && object == _student){
        NSLog(@"age:%ld", (long)_student.age);
        NSLog(@"old age:%@", [change objectForKey:@"old"]);
        NSLog(@"new age:%@", [change objectForKey:@"new"]);
    }
}

@end
