//
//  TWProvince.h
//  iOSLearning
//
//  Created by tang on 16/6/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWProvince : NSObject

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSArray *cities;

+(instancetype)provinceWhithDic:(NSDictionary *)dic;

@end
