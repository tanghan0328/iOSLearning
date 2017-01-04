//
//  TWScaleView.h
//  iOSLearning
//
//  Created by tang on 17/1/4.
//  Copyright © 2017年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWScaleView : UIView

@property (nonatomic,strong)UIView *bgView;//背景
@property (nonatomic,strong)UIView *scaleView;//比例
@property (nonatomic,assign)float maxValue;//最大值
@property (nonatomic,assign)float currentValue;//当前值

@end
