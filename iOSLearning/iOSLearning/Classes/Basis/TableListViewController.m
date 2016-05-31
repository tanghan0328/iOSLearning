//
//  TableListViewController.m
//  iOSLearning
//
//  Created by tang on 16/3/14.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TableListViewController.h"
#import "LabelViewController.h"
#import "ButtonViewController.h"
#import "SegmentViewController.h"
#import "TextFileViewController.h"
#import "SliderViewController.h"
#import "SwitchViewController.h"
#import "ActivityIndicatorViewController.h"
#import "ProgressViewController.h"
#import "StepperViewController.h"
#import "DeviceViewController.h"
#import "ProdCollectionViewController.h"
#import "RepeatCellViewController.h"
#import "ProdTabelViewController.h"
#import "TestAESViewController.h"
#import "CoredataViewController.h"
#import "URLConnectionViewController.h"


@interface TableListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (retain, nonatomic)NSArray *tableArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基础";
    self.navigationController.hidesBottomBarWhenPushed = YES;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    
    self.tableArray = [NSArray arrayWithObjects:
                       @"UILabel",
                       @"UIButton",
                       @"UISegment",
                       @"UITextFile",
                       @"UISlider",
                       @"UISwitch",
                       @"ActivityIndicator",
                       @"progress",
                       @"stepper",
                       @"device",
                       @"collection",
                       @"repeatCell",
                       @"tableview",
                       @"AES加密解密",
                       @"Coredata",
                       @"URLConnection",
                       nil];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"tablelistCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    NSString *title =_tableArray[indexPath.row];
    cell.textLabel.text = title;
    cell.textLabel.font = [UIFont systemFontOfSize:13.0];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UIViewController *viewCotroller = nil;
    NSString *title = _tableArray[indexPath.row];
    switch (indexPath.row) {
        case 0:
            viewCotroller = [[LabelViewController alloc]initWithTitle:title];
            break;
        case 1:
            viewCotroller = [[ButtonViewController alloc]initWithTitle:title];
            break;
        case 2:
            viewCotroller = [[SegmentViewController alloc]initWithTitle:title];
            break;
        case 3:
            viewCotroller = [[TextFileViewController alloc]initWithTitle:title];
            break;
        case 4:
            viewCotroller = [[SliderViewController alloc]initWithTitle:title];
            break;
        case 5:
            viewCotroller = [[SwitchViewController alloc]initWithTitle:title];
            break;
        case 6:
            viewCotroller = [[ActivityIndicatorViewController alloc]initWithTitle:title];
            break;
        case 7:
            viewCotroller = [[ProgressViewController alloc]initWithTitle:title];
            break;
        case 8:
            viewCotroller = [[StepperViewController alloc]initWithTitle:title];
            break;
        case 9:
            viewCotroller = [[DeviceViewController alloc]initWithTitle:title];
            break;
        case 10:
            viewCotroller = [[ProdCollectionViewController alloc]initWithTitle:title];
            break;
        case 11:
            viewCotroller = [[RepeatCellViewController alloc]initWithTitle:title];
            break;
        case 12:
            viewCotroller = [[ProdTabelViewController alloc]initWithTitle:title];
            break;
        case 13:
            viewCotroller = [[TestAESViewController alloc]initWithTitle:title];
            break;
        case 14:
            viewCotroller = [[CoredataViewController alloc]initWithTitle:title];
            break;
        case 15:
            viewCotroller = [[URLConnectionViewController alloc]initWithTitle:title];
            break;
        case 16:
            viewCotroller = [[SliderViewController alloc]initWithTitle:title];
            break;
        case 17:
            viewCotroller = [[SliderViewController alloc]initWithTitle:title];
            break;
        case 18:
            viewCotroller = [[SliderViewController alloc]initWithTitle:title];
            break;
        default:
            break;
    }
    
    if(viewCotroller){
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewCotroller animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}
@end
