//
//  AdvanceViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/6.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "AdvanceViewController.h"
#import "TWPDFReaderViewController.h"
#import "TWImageSenderViewController.h"
#import "TWMoreImagesViewController.h"
#import "TWAFNetWorkingController.h"
#import "TWImageRuntimeController.h"
#import "TWSnakeViewController.h"
#import "TWBlockTestController.h"
#import "TWBezierViewController.h"
#import "TWForestGlassViewController.h"
#import "TWTransitionsViewController.h"
#import "TWCollectionLayoutViewController.h"
#import "TWCircleViewController.h"
#import "TWPWDViewController.h"
#import "TWFingerprintViewController.h"
#import "TWSCanViewController.h"


@interface AdvanceViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) NSArray *stringArray;
@property (nonatomic,retain) UITableView *tableView;

@end

@implementation AdvanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"进阶";
    self.view.backgroundColor = [UIColor greenColor];
    //设置UITableView的大小
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self initWithStringArray];
}
//初始化字符串数组
- (void)initWithStringArray
{
    self.stringArray = [[NSArray alloc]initWithObjects:@"测试PDF文件",
                        @"测试从相机取图片",
                        @"测试多张相机照片",
                        @"测试透明头",
                        @"测试runtime",
                        @"Snake测试问题",
                        @"Block深究",
                        @"三个小圆球",
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
        case 0: selectedView = [[TWPDFReaderViewController alloc] initWithTitle:title];
            break;
        case 1: selectedView = [[TWImageSenderViewController alloc] initWithTitle:title];
            break;
        case 2: selectedView = [[TWMoreImagesViewController alloc] initWithTitle:title];
            break;
        case 3: selectedView = [[TWAFNetWorkingController alloc] init];
            break;
        case 4: selectedView = [[TWImageRuntimeController alloc]initWithTitle:title];
            break;
        case 5: selectedView = [[TWSnakeViewController alloc]initWithTitle:title];
            break;
        case 6:selectedView = [[TWBlockTestController alloc] initWithTitle:title];
            break;
        case 7:selectedView = [[TWBezierViewController alloc]initWithTitle:title];
            break;
        case 8:selectedView = [[TWForestGlassViewController alloc]initWithTitle:title];
            break;
        case 9:selectedView = [[TWTransitionsViewController alloc]init];
            break;
        case 10:selectedView = [[TWCollectionLayoutViewController alloc]initWithTitle:title];
            break;
        case 11:selectedView = [[TWCircleViewController alloc]init];
            break;
        case 12:selectedView = [[TWPWDViewController alloc]initWithTitle:title];
            break;
        case 13:selectedView = [[TWFingerprintViewController alloc]initWithTitle:title];
            break;
        case 14:selectedView = [[TWSCanViewController alloc]initWithTitle:title];
            break;
    }
    if(selectedView){

        [self.navigationController pushViewController:selectedView animated:YES];
        //self.hidesBottomBarWhenPushed=YES;//要显示的viewController设置
    }
}

@end
