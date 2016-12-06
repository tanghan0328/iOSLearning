//
//  TWLoadingCircleView.h
//  iOSLearning
//
//  Created by tang on 16/12/6.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWLoadingCircleView : UIView

// 中间显示的数字
@property (nonatomic, assign) NSInteger rate;
// 开始动画
- (void)startAnimation;

@end
