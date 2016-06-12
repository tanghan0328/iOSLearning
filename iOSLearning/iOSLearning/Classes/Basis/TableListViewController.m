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
#import "TWUIWebViewController.h"

@interface TableListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (retain, nonatomic)NSArray *tableArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基础";
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"226"]];
    //设置成透明色的navigation
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    //给navigationBar设置一个空的背景图片即可实现透明，而且标题按钮都在
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    //其实这个线也是image控制的。设为空即可
    
    //navigationBar是一个复合视图，它是有许多个控件组成的，那么我们就可以从他的内部入手
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 0;
    //这里可以根据scrollView的偏移量来设置alpha就实现了渐变透明的效果
    //在最顶层Controller手势依然有效，但是滑动后，并找不到返回的页面。造成软件卡顿，假死所以就要在rootViewController中让此手势失效。把下面的设为NO
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
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
                       @"UIWebView",
                       nil];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    self.tabBarController.tabBar.hidden = NO;
//    [super viewWillAppear:animated];
//

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
            viewCotroller = [[TWUIWebViewController alloc]initWithTitle:title];
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
