//
//  TWAlphaViewController.m
//  iOSLearning
//
//  Created by tang on 16/9/20.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWAlphaViewController.h"
#import "TWNavigationBarHiddenController.h"

@interface TWAlphaViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableview;

@end

@implementation TWAlphaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitle:@"取消" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 60, 30);
    leftButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [leftButton addTarget:self action:@selector(onBackButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = barItem;
    
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeCustom];

    goButton.frame = CGRectMake(0, 0, 80, 44);
//    [goButton setImage:[UIImage imageNamed:@"btn_dismiss@2x"] forState:UIControlStateNormal];
    [goButton addTarget:self action:@selector(gotoNextController) forControlEvents:UIControlEventTouchUpInside];
    [goButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [goButton setTitle:@"测试" forState:UIControlStateNormal];
    goButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    UIBarButtonItem *itemA = [[UIBarButtonItem alloc] initWithCustomView:goButton];
    
    self.navigationItem.rightBarButtonItem = itemA;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //去除黑线
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list = self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = (UIImageView *)obj;
                NSLog(@"====imageView的名字======%@", imageView);
                NSArray *list2 = imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2 = (UIImageView *)obj2;
                        imageView2.hidden = YES;
                        NSLog(@"====imageView的名字********======%@", imageView2);

                    }
                }
            }
        }
    }
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:_tableview];
}

- (void)onBackButtonClicked
{
    NSLog( @"测试到了这里。。。。。。。。。。。。");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)gotoNextController
{
    TWNavigationBarHiddenController *controller = [[TWNavigationBarHiddenController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
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
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewRowActionStyleDefault;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = @"请你测试看看，这个问题有可能解决";
    return cell;
}


@end
