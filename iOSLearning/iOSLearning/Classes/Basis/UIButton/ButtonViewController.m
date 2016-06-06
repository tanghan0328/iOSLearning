//
//  ButtonViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/16.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "ButtonViewController.h"
#import "TWBtnTestViewController.h"

@interface ButtonViewController ()<UIAlertViewDelegate>

@end

@implementation ButtonViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithButton
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    //文字左对齐
   // button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    UIImage *image = [UIImage imageNamed:@"ugc_btn_time_click@2x"];
    [button setImage:image forState:UIControlStateNormal];
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
//    button.imageEdgeInsets = UIEdgeInsetsMake(0, 60, 0, 0);
    
    [button addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *buttonTest = [[UIButton alloc]initWithFrame:CGRectMake(60, 200, 200, 30)];
    buttonTest.backgroundColor = [UIColor greenColor];
    [buttonTest setTitle:@"点击跳转到另外一页" forState:UIControlStateNormal];
    [buttonTest addTarget:self action:@selector(onBtnTestClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTest];
}

- (void)onBtnClick:(id)action
{
    NSLog(@"=======onBtnClick==========");
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"同意" message:@"看看内容" delegate:self cancelButtonTitle:nil otherButtonTitles: @"购买普通商品",@"购买预售商品",nil];
    [alertView show];
}

- (void)onBtnTestClick:(UIButton *)btn
{
    TWBtnTestViewController *controller = [[TWBtnTestViewController alloc]init];
    //UIModalTransitionStyleFlipHorizontal 翻转
    //UIModalTransitionStyleCoverVertical 底部滑出
    //UIModalTransitionStyleCrossDissolve 渐显
    //UIModalTransitionStylePartialCurl 翻页
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
   // [self presentViewController:controller animated:YES completion:nil];
    [self.navigationController pushViewController:controller animated:YES];
}
//根据被点击按钮的索引处理点击事件
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"clickButtonAtIndex:%d",buttonIndex);
}
@end
