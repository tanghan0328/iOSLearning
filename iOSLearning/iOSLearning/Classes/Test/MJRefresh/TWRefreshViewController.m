//
//  TWRefreshViewController.m
//  iOSLearning
//
//  Created by tang on 17/1/4.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "TWRefreshViewController.h"
#import "MJRefresh.h"
static const CGFloat MJDuration = 2.0;

@interface TWRefreshViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) UITableView *tableViewA;

@end

@implementation TWRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [[NSMutableArray alloc]init];
    for(int i=0; i<10;i++){
        [self.datas addObject:[NSString stringWithFormat:@"测试%d",i]];
    }
    self.tableViewA = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableViewA.delegate = self;
    _tableViewA.dataSource = self;
    [self.view addSubview:_tableViewA];
    
    __weak __typeof(self) weakSelf = self;
    self.tableViewA.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    self.tableViewA.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
    
}

- (void)loadNewData
{
    for(int i = 10; i<15; i++){
        [self.datas addObject:[NSString stringWithFormat:@"测试上拉数据%d",i]];
    }
    __weak UITableView *tableview = self.tableViewA;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, MJDuration *NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [tableview reloadData];
        
        [tableview.mj_header endRefreshing];
    });
    
}

- (void)loadMoreData
{
    for(int i = 10;i<15;i++){
        [self.datas addObject:[NSString stringWithFormat:@"测试下拉数据%d",i]];
    }
    
    __weak UITableView *tableView = self.tableViewA;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,MJDuration *NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [tableView reloadData];
        [tableView.mj_footer endRefreshing];
    });
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"UITableViewCellA";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
