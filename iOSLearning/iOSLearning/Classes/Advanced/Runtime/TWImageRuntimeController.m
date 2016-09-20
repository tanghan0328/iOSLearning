//
//  TWImageRuntimeController.m
//  iOSLearning
//
//  Created by tang on 16/9/20.
//  Copyright © 2016年 tang. All rights reserved.
//

//参考文章为 ： http://www.jianshu.com/p/cf64bb1eacc3

#import "TWImageRuntimeController.h"
#import "TWPersonA.h"
#import "NSObject+TWObject.h"

@interface TWImageRuntimeController ()
@end

@implementation TWImageRuntimeController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 需求：给imageNamed方法提供功能，每次加载图片就判断下图片是否加载成功。
    // 步骤一：先搞个分类，定义一个能加载图片并且能打印的方法+ (instancetype)imageWithName:(NSString )name;
    // 步骤二：交换imageNamed和imageWithName的实现，就能调用imageWithName，间接调用imageWithName的实现。
    UIImage *image = [UIImage imageNamed:@"123"];

    
    TWPersonA *p = [[TWPersonA alloc] init];
    // 默认person，没有实现eat方法，可以通过performSelector调用，但是会报错。
    // 动态添加方法就不会报错
    [p performSelector:@selector(eat)];
    
    NSObject *obj = [[NSObject alloc]init];
    obj.name = @"测试========》";
    NSLog(@"增加的属性为===》%@",obj.name);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
