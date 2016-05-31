//
//  MySliderView.m
//  iOSLearning
//
//  Created by tang on 16/3/17.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "MySliderView.h"
#import "MySliderView.h"

@interface MySliderView()
{
    UIImageView *left;
    UIImageView *right;
    UIImageView *sliderView;
}
@end

@implementation MySliderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    left =[[UIImageView alloc]initWithImage: [UIImage imageNamed:@"min"]];
    left.frame = CGRectMake(0, 0, 247, 55);
    right = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"max"]];;
    right.frame = CGRectMake(0, 0, 247, 55);

    [self addSubview:left];
    [self addSubview:right];
    
    sliderView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tag"]];
    sliderView.frame = CGRectMake(176,0 , 26, 42);
    
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(volumeSliderChange:)];
    sliderView.userInteractionEnabled = YES;
    [sliderView addGestureRecognizer:panRecognizer];
    [self addSubview:sliderView];
    
    
}

- (void)volumeSliderChange:(id)sender
{
    UIPanGestureRecognizer *gesture = sender;
    CGPoint point = [gesture locationInView:self];
    NSLog(@"  point.x======%f=*****point.x***%f***=   ",point.x,point.y);
    
    if(point.x > 200){
        point.x =200;
    }else if(point.x < 0){
        point.x = 0;
    }
    
    sliderView.frame = CGRectMake(point.x, 0, 26, 42);
    right.frame = CGRectMake(0, 0, point.x, 55);
}

@end
