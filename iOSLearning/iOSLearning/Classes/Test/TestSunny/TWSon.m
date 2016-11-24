//
//  TWSon.m
//  iOSLearning
//
//  Created by tang on 16/11/24.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWSon.h"
#import "TWFather.h"
#import <objc/runtime.h>

static char associatedObjectKey;

@implementation TWSon

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    
    //设置关联对象
    objc_setAssociatedObject(self, &associatedObjectKey, @"添加的字符串属性", OBJC_ASSOCIATION_RETAIN_NONATOMIC); //获取关联对象
    NSString *string = objc_getAssociatedObject(self, &associatedObjectKey);
    NSLog(@"AssociatedObject = %@", string);
    
    [self performSelector:@selector(resolveAdd:) withObject:@"test"];
    return self;
}

void runAddMethod(id self,SEL _cmd,NSString *string)
{
    NSLog(@"=====>  add C IMP ",string);
}


+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    //给本类动态添加一个方法
    if ([NSStringFromSelector(sel) isEqualToString:@"resolveAdd:"]) {
        class_addMethod(self, sel, (IMP)runAddMethod, "v@:*");
    }
    return YES;
}

@end
