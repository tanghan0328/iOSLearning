//
//  SegmentViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/16.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "SegmentViewController.h"

@interface SegmentViewController ()

@property (nonatomic, retain)NSArray* stringArray;
@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithSegment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithSegment
{
    self.stringArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:_stringArray];
    
    segment.frame = CGRectMake(20, 100, SCREEN_WIDTH - 50, 40);
    segment.backgroundColor = [UIColor grayColor];
    [segment setTitle:@"测试" forSegmentAtIndex:2];
    NSLog(@"======title   %@===",[segment titleForSegmentAtIndex:2]);
    [segment setImage:[UIImage imageNamed:@"ugc_btn_time_click@2x"] forSegmentAtIndex:0];
    NSLog(@"***imageName**%f*",[segment imageForSegmentAtIndex:0].size.width);
    
    [segment insertSegmentWithImage:[UIImage imageNamed:@"ugc_btn_time_click@2x"] atIndex:5 animated:YES];
    [segment insertSegmentWithTitle:@"插入6" atIndex:6 animated:YES];
    
    segment.selectedSegmentIndex = 2;
    
    NSLog(@"=====number=%d==selected==%d==",segment.numberOfSegments,segment.selectedSegmentIndex);
    
    [segment addTarget:self action:@selector(onSegmentClick:) forControlEvents:UIControlEventValueChanged];
    
    segment.multipleTouchEnabled = NO;
    segment.momentary = YES;
    
    [self.view addSubview:segment];
    
    
}

- (void)onSegmentClick:(UISegmentedControl *)segmentControl
{
    NSInteger index = segmentControl.selectedSegmentIndex;
    switch (index) {
        case 0:
            NSLog(@"点击了0");
            break;
        case 1:
            NSLog(@"点击了2");
            break;
        default:
            break;
    }
}

@end
