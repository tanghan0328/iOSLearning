//
//  TWBlockRegisterViewController.h
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^returnFirstView)(NSArray *array);

@interface TWBlockRegisterViewController : BaseViewController

@property (nonatomic, strong)returnFirstView block;
-(void)sendMessage:(returnFirstView)block;

@end
