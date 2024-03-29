//
//  DevelopViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/6.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "DevelopViewController.h"
#import "TimerViewController.h"
#import "TWFileViewController.h"
#import "TWDateViewController.h"
#import "TWWKWebViewController.h"
#import "TWPThreadViewController.h"
#import "TWThreadSynchronizeViewController.h"
#import "PlistViewController.h"
#import "TWPlistRWViewController.h"
#import "TWParticlesViewController.h"
#import "TWReflectionViewController.h"
#import "TWElasticViewController.h" 
#import "TWFoldingViewController.h"
#import "TWImageZoomViewController.h"
#import "TWNotificationViewController.h"
#import "TWDelegateViewController.h"
#import "TWBlockViewController.h"
#import "TWSignatureViewController.h"
#import "TWKVOViewController.h"
#import "TWGoldZoneViewController.h"
#import "TWLabelViewController.h"


@interface DevelopViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableview;
@property (nonatomic, retain) NSArray *nameList;
@end

@implementation DevelopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customTitle = @"开发";    
    self.view.backgroundColor = [UIColor yellowColor];
    //设置status 颜色为黑色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    self.nameList = [NSArray arrayWithObjects:@"测试定时器",
                                             @"文件测试",
                                             @"时间测试",
                                             @"WKWebview测试",
                                             @"thread测试",
                                             @"TWThreadSynchronize",
                                             @"plist文件测试",
                                             @"plist文件读写测试",
                                             @"粒子效果测试",
                                             @"图片倒影",
                                             @"QQ弹性",
                                             @"图片折叠",
                                             @"图片缩放",
                                             @"通知测试",
                                             @"代理测试",
                                             @"Block测试",
                                             //@"签名的测试",
                                             @"KVO的测试",
                                             @"自适应的label",
                                             @"刮刮乐",
                                             @"加载同一个控件",
                                             nil];
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_tableview];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    //测试断言
//    Boolean flag = false;
//    NSAssert(flag, @"测试=====》", self.tableview);
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = NO;
//    [super viewWillAppear:animated];
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.nameList[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:13.0];
    cell.backgroundColor = [self randomColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *selectedView = nil;
    switch (indexPath.row) {
        case 0:
            selectedView = [[TimerViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 1:
            selectedView = [[TWFileViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 2:
            selectedView = [[TWDateViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 3:
            selectedView = [[TWWKWebViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 4:
            selectedView = [[TWPThreadViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 5:
            selectedView = [[TWThreadSynchronizeViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 6:
            selectedView = [[PlistViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 7:
            selectedView = [[TWPlistRWViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 8:
            selectedView = [[TWParticlesViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 9:
            selectedView = [[TWReflectionViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 10:
            selectedView = [[TWElasticViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 11:
            selectedView = [[TWFoldingViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 12:
            selectedView = [[TWImageZoomViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 13:
            selectedView = [[TWNotificationViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 14:
            selectedView = [[TWDelegateViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 15:
            selectedView = [[TWBlockViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 16:
           // selectedView = [[TWSignatureViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            selectedView = [[TWKVOViewController alloc]initWithTitle:self.nameList[indexPath.row]];
            break;
        case 17:
            selectedView =[[TWLabelViewController alloc] initWithTitle:self.nameList[indexPath.row]];
            break;
        case 18:
            selectedView =[[TWGoldZoneViewController alloc] initWithTitle:self.nameList[indexPath.row]];
            break;
    }
    if (selectedView != nil) {
        //隐藏tabbar
        //self.hidesBottomBarWhenPushed=YES;//要显示的viewController设置
        [self.navigationController pushViewController:selectedView animated:YES];
        //self.hidesBottomBarWhenPushed = NO;
    }
}


- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    
    return [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:1];
}


@end
