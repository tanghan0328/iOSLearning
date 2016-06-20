//
//  TWProvince.m
//  iOSLearning
//
//  Created by tang on 16/6/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWProvince.h"

@implementation TWProvince

+(instancetype)provinceWhithDic:(NSDictionary *)dic
{
    TWProvince *province = [[super alloc] init];
    
    [province setValuesForKeysWithDictionary:dic];
    NSLog(@"TWProvince 的Name%@, city个数%d", province.name,province.cities.count);
    return province;
}

@end
