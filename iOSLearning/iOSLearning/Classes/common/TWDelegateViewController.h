//
//  TWDelegateViewController.h
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "BaseViewController.h"

@protocol NSUserDelegate <NSObject>

- (void)registerUserName:(NSString *)userName passwrod:(NSString *)password;

@end

@interface TWDelegateViewController : BaseViewController

@property (nonatomic, assign) id<NSUserDelegate> delegate;

@end
