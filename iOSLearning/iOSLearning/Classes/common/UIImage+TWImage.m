//
//  UIImage+TWImage.m
//  iOSLearning
//
//  Created by tang on 16/9/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "UIImage+TWImage.h"
#import <objc/runtime.h>

static const char *key = "TWname";

@implementation UIImage (TWImage)

+(void)load
{
    // 交换方法
    // 获取imageWithName方法地址
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    // 获取imageWithName方法地址
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    // 交换方法地址，相当于交换实现方式
    method_exchangeImplementations(imageWithName, imageName);
}

// 不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉，而且分类中不能调用super.
// 既能加载图片又能打印
+(instancetype)imageWithName:(NSString* )name
{
    // 这里调用imageWithName，相当于调用imageName
    UIImage *image = [self imageWithName:name];
    if (image == nil) {
        NSLog(@"加载空的图片");
    }else{
        NSLog(@"加载的图片名称为====》%@",name);
    }
    return image;
}


- (NSString *)TWname
{
    // 根据关联的key，获取关联的值。
    return objc_getAssociatedObject(self, key);
}

- (void)setTWname:(NSString *)TWname
{
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    objc_setAssociatedObject(self,key,TWname,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
