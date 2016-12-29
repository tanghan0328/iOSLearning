//
//  TWLocationUpdateManager.h
//  iOSLearning
//
//  Created by tang on 16/12/29.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWLocationUpdateManager : NSObject

+ (instancetype)sharedStandardManager;//单例实例化
- (void)startStandardUpdatingLocation;//定位开启
- (void)stopStandardUpdatingLocation;//定位关闭

@end
