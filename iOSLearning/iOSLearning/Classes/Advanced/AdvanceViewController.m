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
                        @"测试透明头",nil];
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
    }
    if(selectedView){
        [self.navigationController pushViewController:selectedView animated:YES];
        //self.hidesBottomBarWhenPushed=YES;//要显示的viewController设置
    }
}

@end
