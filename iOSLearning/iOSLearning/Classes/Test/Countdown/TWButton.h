//
//  TWButton.h
//  iOSLearning
//
//  Created by tang on 16/12/7.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWButton : UIButton

//专用于定时器的butten默认是60秒
@property (nonatomic, assign) NSInteger Timer;
//初始的文字
@property (nonatomic, strong) NSString *normalText;
//设置启动后的文字
-(void)setbuttenfrontTitle:(NSString *)frontstr backtitle:(NSString *)backstr;

@end
