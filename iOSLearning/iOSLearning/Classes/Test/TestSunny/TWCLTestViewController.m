//
//  TWCLTestViewController.m
//  iOSLearning
//
//  Created by tang on 16/12/5.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWCLTestViewController.h"

@import Foundation;

@interface TWCLTestViewController()

@property (nonatomic, copy) NSString *title;

@end

@implementation TWCLTestViewController {
    //    NSString *_title;
}

@synthesize title = _title;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = @"微博@iOS程序犭袁";
    }
    return self;
}

- (NSString *)title {
    return _title;
}

- (void)setTitle:(NSString *)title {
    _title = [title copy];
}

@end

