//
//  TWSon.m
//  iOSLearning
//
//  Created by tang on 16/11/24.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWSon.h"
#import "TWFather.h"

@implementation TWSon

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }

    
    return self;
}


@end
