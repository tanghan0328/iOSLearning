//
//  LabelViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/16.
//  Copyright © 2016年 tang. All rights reserved.
//

//测试label中的常用属性

#import "LabelViewController.h"

@interface LabelViewController ()

@end

@implementation LabelViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"======self.view.frame===%@==",NSStringFromCGRect(self.view.frame));
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"UILabel";
    [self initLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initLabel
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(130, 90, 100, 30)];
    
    label.backgroundColor = [UIColor grayColor];
    //设置字体颜色
    label.font = [UIFont systemFontOfSize:13.0];
    //设置label显示文字的行数
    label.numberOfLines = 1;
    //设置文字显示位置
    label.textAlignment = NSTextAlignmentCenter;
    //设置文字颜色
    label.textColor = [UIColor redColor];
    //label中的内容
    label.text = @"测试label";
    
    [self.view addSubview:label];
    
    //富文本的label
    UILabel *autolabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, SCREEN_WIDTH -40, 120)];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:@"【预售】日前有大批iOS 9.3用户在苹果问题支持论坛表示，\n他们的设备在点击Safari、消息、"];
    [attributedStr beginEditing];
    [attributedStr addAttribute:NSForegroundColorAttributeName
                          value:[UIColor redColor]
                          range:NSMakeRange(0, 4)];
    [attributedStr endEditing];
    
    autolabel.numberOfLines = 9;
    autolabel.attributedText = attributedStr;
    
    [self.view addSubview:autolabel];
    
    //自适应label 切记不要设置宽与高的约束，否则失效
    UILabel *commentContent = [[UILabel alloc]initWithFrame:CGRectMake(20, 270, SCREEN_WIDTH -40, SCREEN_HEIGHT - 270)];
    NSMutableString *contentText = [[NSMutableString alloc] initWithString: @"预售 日前有大批iOS 9.3用户在苹果问题支持论用户在苹果问题支持论用户在苹果问题支持论用户在苹果问题支持论用户在苹果问题支持论用户在苹果问题支持论用户在苹果问题支持论用户在苹果问题支持论用户在苹果问题支持论用户在苹果问题支持论用户在苹果问题支持论"];
    //NSDictionary *dictionary = @{NSFontAttributeName:[UIFont systemFontOfSize:11.0]};
    CGSize size =[contentText boundingRectWithSize:CGSizeMake(290.0, 5000) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes: @{NSFontAttributeName: [UIFont systemFontOfSize:13.0]} context:nil].size;
    NSLog(@"=====UILabel ===%@===",NSStringFromCGSize(size));
    
    commentContent.frame = CGRectMake(20, 270, SCREEN_WIDTH-40, size.height );
    commentContent.numberOfLines = 0;
    commentContent.font = [UIFont systemFontOfSize:13.0];
    commentContent.text = contentText;
    [self.view addSubview:commentContent];
    
}

@end
