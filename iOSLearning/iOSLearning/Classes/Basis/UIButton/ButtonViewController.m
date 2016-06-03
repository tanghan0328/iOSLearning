//
//  ButtonViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/16.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "ButtonViewController.h"

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
    
}

- (void)onBtnClick:(id)action
{
    NSLog(@"=======onBtnClick==========");
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"同意" message:@"看看内容" delegate:self cancelButtonTitle:nil otherButtonTitles: @"购买普通商品",@"购买预售商品",nil];
    [alertView show];
}

//根据被点击按钮的索引处理点击事件
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"clickButtonAtIndex:%d",buttonIndex);
}
@end
