//
//  TWBlockLoginViewController.h
//  iOSLearning
//
//  Created by tang on 16/6/8.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "BaseViewController.h"

@interface TWBlockLoginViewController : BaseViewController

@property (nonatomic, retain)NSString *usernameText;
@property (nonatomic, retain)NSString *passwordText;

- (void)initWhithUsername:(NSString *)username password:(NSString *)password;

@end
