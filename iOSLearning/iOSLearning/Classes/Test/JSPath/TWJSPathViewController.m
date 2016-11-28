//
//  TWJSPathViewController.m
//  iOSLearning
//
//  Created by tang on 16/11/28.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWJSPathViewController.h"

@interface TWJSPathViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView* myTableView;

@end

@implementation TWJSPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView* tv =[[UITableView alloc]initWithFrame:self.view.bounds
                                                 style:UITableViewStylePlain];
    self.myTableView = tv;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* i=  @"cell";
    UITableViewCell* cell = [tableView  dequeueReusableCellWithIdentifier:i];
    if (cell == nil ) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:i];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"title===%ld", indexPath.row];
    return cell;
}

@end
