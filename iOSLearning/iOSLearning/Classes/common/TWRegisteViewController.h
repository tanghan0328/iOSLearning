//
//  TWRegisteViewController.h
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "BaseViewController.h"


@protocol RegisterDelegate <NSObject>

- (void)sendUserName:(NSString *)userName password:(NSString *)password;

@end

@interface TWRegisteViewController : BaseViewController

@property (nonatomic, assign)id<RegisterDelegate> delegate;

@end
