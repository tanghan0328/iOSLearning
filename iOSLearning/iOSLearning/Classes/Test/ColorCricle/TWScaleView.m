//
//  TWScaleView.m
//  iOSLearning
//
//  Created by tang on 17/1/4.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "TWScaleView.h"

@implementation TWScaleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor clearColor];
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _bgView.layer.borderColor = [UIColor clearColor].CGColor;
        _bgView.layer.borderWidth = 0.5f;
        _bgView.layer.cornerRadius = self.frame.size.height/2;
        [_bgView.layer setMasksToBounds:YES];
        _bgView.clipsToBounds = YES;
        [self addSubview:_bgView];
        
        _scaleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height/2, self.frame.size.height)];
        _scaleView.layer.borderColor = [UIColor clearColor].CGColor;
        _scaleView.layer.borderWidth = 0.5f;
        _scaleView.layer.cornerRadius = self.frame.size.height/2;
        [_scaleView.layer setMasksToBounds:YES];
        [self addSubview:_scaleView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [UIView animateWithDuration:1.8 animations:^{
        _scaleView.frame = CGRectMake(0, 0, self.currentValue/self.maxValue*self.frame.size.width, self.frame.size.height);
    }];
}

@end
