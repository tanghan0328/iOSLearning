//
//  TestViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/6.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TestViewController.h"
#import "TWSunnyViewController.h"
#import "TWJSPathViewController.h"
#import "TWCalendarViewController.h"
#import "TWRandomCodeViewController.h"
#import "TWCLPhotoBrowserViewController.h"
#import "TWLoadingViewController.h"
#import "TWCountdownViewController.h"
#import "TWLocationViewController.h"

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) NSArray *stringArray;
@property (nonatomic,retain) UITableView *tableView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].applicationIconBadgeNumber=8;
    
    self.title = @"测试新的东西";
    //设置status的颜色为白色
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    //设置UITableView的大小
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self initWithStringArray];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
}

//初始化字符串数组
- (void)initWithStringArray
{
    self.stringArray = [[NSArray alloc]initWithObjects:@"测试sunnyxx的问题",
                        @"JSPath测试",
                        @"测试日历插入提醒",
                        @"测试CLPhotoBrowser",
                        @"随机验证的字符码",
                        @"LoadingCircle",
                        @"倒计时的button封装",
                        @"手机的地址与时间",
                        @"毛玻璃效果",
                        @"转场",
                        @"UICollection的layout自定义",
                        @"复杂的CollectionLayout",
                        @"微信支付的密码框",
                        @"APPID的指纹",
                        @"二维码扫描",
                        nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _stringArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"AdvanceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:13.0f];
    cell.textLabel.text = self.stringArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *selectedView = nil;
    NSString *title  = self.stringArray[indexPath.row];
    switch (indexPath.row) {
        case 0:selectedView = [[TWSunnyViewController alloc]initWithTitle:title];
            break;
        case 1:selectedView = [[TWJSPathViewController alloc]initWithTitle:title];
            break;
        case 2:selectedView = [[TWCalendarViewController alloc]initWithTitle:title];
            break;
        case 3:selectedView = [[TWCLPhotoBrowserViewController alloc]initWithTitle:title];
            break;
        case 4:selectedView = [[TWRandomCodeViewController alloc]initWithTitle:title];
            break;
        case 5:selectedView = [[TWLoadingViewController alloc]initWithTitle:title];
            break;
        case 6:selectedView = [[TWCountdownViewController alloc]initWithTitle:title];
            break;
        case 7:selectedView = [[TWLocationViewController alloc]initWithTitle:title];
            break;
    }
    if(selectedView){
        
        [self.navigationController pushViewController:selectedView animated:YES];
        //self.hidesBottomBarWhenPushed=YES;//要显示的viewController设置
    }
}

@end

