//
//  BaseViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/16.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "BaseViewController.h"
#import <objc/runtime.h>


@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if(self){
        self.view.backgroundColor = [UIColor whiteColor];
 //       [self setupBackButtonForNavigationBar];
        self.title = title;
        self.view.backgroundColor = [UIColor whiteColor];
        
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            //需要遵循一下手势的代理        self.navigationController.interactivePopGestureRecognizer.delegate = self;
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
    }
    return self;
}

- (void)viewDidLoad {
    NSLog(@"是不是所有的人都在这里");
    [super viewDidLoad];
    [self testCLanguage];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//获取类的C语言方法。
- (void)testCLanguage
{
    unsigned int count;
    //获取属性列表
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i=0; i<count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"property---->%@", [NSString stringWithUTF8String:propertyName]);
    }
    
    //获取方法列表
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Method method = methodList[i];
        NSLog(@"method---->%@", NSStringFromSelector(method_getName(method)));
    }
    
    //获取成员变量列表
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar---->%@", [NSString stringWithUTF8String:ivarName]);
    }
    
    //获取协议列表
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i; i<count; i++) {
        Protocol *myProtocal = protocolList[i];
        const char *protocolName = protocol_getName(myProtocal);
        NSLog(@"protocol---->%@", [NSString stringWithUTF8String:protocolName]);
    }
}




////加载设置自定义的返回按钮
//- (void)setupBackButtonForNavigationBar
//{
//    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
//    [backButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(onBackButtonClicked) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    self.navigationItem.leftBarButtonItem = item;
//}
//
//- (void)onBackButtonClicked
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

@end
