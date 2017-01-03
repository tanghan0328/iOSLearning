//
//  TWLinkageViewController.m
//  iOSLearning
//
//  Created by tang on 17/1/3.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "TWLinkageViewController.h"
#import "TableViewController.h"
#import "CollectionViewController.h"


@interface TWLinkageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *datas;
@property (nonatomic, strong) UITableView *tableViewA;

@end

@implementation TWLinkageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = @[@"UITableView",@"UICollectionView"];
    self.tableViewA = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableViewA.delegate = self;
    _tableViewA.dataSource = self;
    [self.view addSubview:_tableViewA];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        TableViewController *table = [[TableViewController alloc] init];
        table.title = self.datas[indexPath.row];
        [self.navigationController pushViewController:table animated:YES];
    }
    else
    {
        CollectionViewController *collection = [[CollectionViewController alloc] init];
        collection.title = self.datas[indexPath.row];
        [self.navigationController pushViewController:collection animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
