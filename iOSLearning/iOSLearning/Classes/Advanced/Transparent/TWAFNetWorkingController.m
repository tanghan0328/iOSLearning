//
//  TWAFNetWorkingController.m
//  iOSLearning
//
//  Created by tang on 16/9/18.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWAFNetWorkingController.h"
#import "TWAlphaViewController.h"

@interface TWAFNetWorkingController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>{
    UIImageView *navBarHairlineImageView;
    
}

@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic, assign) BOOL statusBarStyleControl;
@end

@implementation TWAFNetWorkingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
    navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 0;
    
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_tableview];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    navBarHairlineImageView.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    navBarHairlineImageView.hidden = NO;
    [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//- (void)startLoadingRequest
//{
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"%@http://appapi.vancl.com/index_action/index_data"]];
//    
//
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"normalCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = @"测试cell";
    cell.backgroundColor = [self randomColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if(indexPath.row == 0){
        TWAlphaViewController *controller = [[TWAlphaViewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
//    }
}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat offsetY = scrollView.contentOffset.y + _tableview.contentInset.top;//注意
//    //    NSLog(@"%lf", offsetY);
//    CGFloat _topContentInset = 100.0f;
//    CGFloat _alphaMemory = 0;
//    
//    if (offsetY > _topContentInset && offsetY <= _topContentInset * 2) {
//        
//        _statusBarStyleControl = YES;
//        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
//            [self setNeedsStatusBarAppearanceUpdate];
//        }
//        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
//        
//        _alphaMemory = offsetY/(_topContentInset * 2) >= 1 ? 1 : offsetY/(_topContentInset * 2);
//        
//        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:_alphaMemory];
//        
//    }else if (offsetY <= _topContentInset) {
//        
//        _statusBarStyleControl = NO;
//        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
//            [self setNeedsStatusBarAppearanceUpdate];
//        }
//        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//        
//        _alphaMemory = 0;
//        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:0];
//    }else if (offsetY > _topContentInset * 2) {
//        _alphaMemory = 1;
//        [[[self.navigationController.navigationBar subviews] objectAtIndex:0] setAlpha:1];
//    }
//}

- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    
    return [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:1];
}

@end
