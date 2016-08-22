//
//  TWLabelViewController.m
//  iOSLearning
//
//  Created by tang on 16/7/27.
//  Copyright © 2016年 tang. All rights reserved.
//解释  同一个控件只能在一个view中添加
//不能在不同的view中添加一个view 因为只有最后一个显示添加的view
//

#import "TWLabelViewController.h"

@interface TWLabelViewController ()

@property (nonatomic,retain)UILabel *label;

@property (nonatomic,retain)UIView *viewOne;

@property (nonatomic,retain)UIView *viewSecond;

@property (nonatomic,strong) NSMutableArray *interestArray;/*存放选中的按钮*/

@end

@implementation TWLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self viewtwo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testAddBtn
{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    _label.backgroundColor = [UIColor redColor];
    _viewOne = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 150, 200)];
    _viewOne.backgroundColor = [UIColor grayColor];
    _viewSecond = [[UIView alloc]initWithFrame:CGRectMake(160, 100, 150, 200)];
    _viewSecond.backgroundColor = [UIColor greenColor];
    
    [_viewOne addSubview:_label];
    //    [_viewSecond addSubview:_label];
    
    [self.view addSubview:_viewOne];
    [self.view addSubview:_viewSecond];
}

- (void)viewtwo{
    UIView * tagView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-100)];
    //第一个 label的起点
    CGSize size = CGSizeMake(5, 30);
    
    //间距
    CGFloat padding = 5.0;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    NSArray *titleArr = @[@"北京欢sdf迎您",@"北fads京欢迎您",@"北京sdfasas欢迎您",@"北京sdfasf欢迎您",@"北京sdfa您",@"北京sdfsaf欢迎您",@"北京sdfsaf欢迎您",@"北您",@"北京是打发撒旦双方的飞洒欢迎您",@"北京阿斯蒂芬迎您",@"北京sdfsaf欢迎您",@"北迎您",];
    for (int i = 0; i < titleArr.count; i ++) {
        
        CGFloat keyWorldWidth = [self getSizeByString:titleArr[i] AndFontSize:14].width;
        if (keyWorldWidth > width) {
            keyWorldWidth = width;
        }
        if (width - size.width < keyWorldWidth) {
            size.height += 30.0;
            size.width = 5.0;
        }
        //创建 label点击事件
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(size.width, size.height-30, keyWorldWidth, 20)];
        button.titleLabel.numberOfLines = 0;
        button.backgroundColor = [UIColor redColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.layer.cornerRadius = 3.0;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [tagView addSubview:button];
        button.tag = i;
        [button addTarget:self action:@selector(tagButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        //起点 增加
        size.width += keyWorldWidth+padding;
    }
    [self.view addSubview:tagView];
}

- (void)handleButton:(UIButton *)button{
    button.selected = !button.selected;
    if (button.selected) {
        
        button.backgroundColor = [UIColor redColor];
        [self.interestArray addObject:button.titleLabel.text];
        
    }else{
        
        button.backgroundColor = [UIColor lightGrayColor];
        [self.interestArray removeObject:button.titleLabel.text];
    }
    
    
}
- (void)tagButtonClick:(UIButton *)button{
    
    NSLog(@"%@",button.titleLabel.text);
}
//计算文字所占大小
- (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font
{
    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    size.width += 5;
    return size;
}

@end
