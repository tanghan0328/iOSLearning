//
//  TWBaseNavigationController.h
//  iOSLearning
//
//  Created by tang tang on 2023/9/7.
//  Copyright © 2023 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TWBaseNavigationController : UINavigationController

- (void)setBarClear;
- (void)setBackgroundImage:(UIImage*)bI shadowImage: (UIImage*)sI;

@end

NS_ASSUME_NONNULL_END
