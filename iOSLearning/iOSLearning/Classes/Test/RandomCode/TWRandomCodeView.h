//
//  TWRandomCodeView.h
//  iOSLearning
//
//  Created by tang on 16/12/6.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MQCodeImageBlock)(NSString *codeStr);

@interface TWRandomCodeView : UIView

@property (nonatomic, strong) NSString *imageCodeStr;
@property (nonatomic, assign) BOOL isRotation;
@property (nonatomic, copy) MQCodeImageBlock bolck;

-(void)freshVerCode;

@end

