//
//  NSObject+TWObject.m
//  iOSLearning
//
//  Created by tang on 16/9/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "NSObject+TWObject.h"
#import <objc/runtime.h>

// 定义关联的key
static const char *key = "name";
@implementation NSObject (TWObject)

- (NSString *)name
{
    // 根据关联的key，获取关联的值。
    return objc_getAssociatedObject(self, key);
}
- (void)setName:(NSString *)name
{
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    objc_setAssociatedObject(self,key,name,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//自动根据一个字典，生成对应的属性，和字典中的key一一对应。
+(void)resolveDict:(NSDictionary* )dict{

    NSMutableString *strM = [NSMutableString string];
    [dict enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *type;
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            type = @"NSString";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]){
            type = @"NSArray";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            type = @"int";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
            type = @"NSDictionary";
        }
        // 属性字符串
        NSString *str;
        if ([type containsString:@"NS"]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;",type,key];
        }else{
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) %@ %@;",type,key];
        }
        // 每生成属性字符串，就自动换行。
        [strM appendFormat:@"\n%@\n",str];
    }];
    // 把拼接好的字符串打印出来，就好了。
    NSLog(@"%@",strM);
}

@end
