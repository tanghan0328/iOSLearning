//
//  TWTitleScrollViewController.m
//  iOSLearning
//
//  Created by tang on 17/1/9.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "TWTitleScrollViewController.h"
#import "TWSegmentControl.h"

@interface TWTitleScrollViewController ()<UIScrollViewDelegate,LXSegmentControlDelegate>

@property (nonatomic, strong)TWSegmentControl *segmentControl;
@property (nonatomic, strong) UIScrollView *mainScrollView;

@end

@implementation TWTitleScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title =@"两种类型NAVTabbar";
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 1.添加所有子控制器
    [self setupChildViewController];
    
    [self setupSegmentedControl];
    self.navigationItem.rightBarButtonItem  =[[UIBarButtonItem alloc]initWithTitle:@"切换滚动类型" style:UIBarButtonItemStylePlain target:self action:@selector(switchType:)];
    
}
-(void)switchType:(UIBarButtonItem *)buttonItem
{
    if (self.segmentControl.scrollType == TWSegmentControlTypeCenterScroll) {
        self.segmentControl.scrollType = TWSegmentControlTypeCenterScroll;
    }else
    {
        self.segmentControl.scrollType = TWSegmentControlTypeEndScroll;
    }
    
}
- (void)setupSegmentedControl {
    
    
    NSArray *title_arr = @[@"精选啊啊哈哈儿很听话", @"电视剧", @"电影", @"综艺", @"NBA", @"新闻", @"娱乐", @"音乐", @"网络电影"];
    
    self.segmentControl =[TWSegmentControl segmentControlWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44) delegate:self titleArr:title_arr];
    self.segmentControl.scrollType = TWSegmentControlTypeEndScroll;
    [self.view addSubview:self.segmentControl];
    
    // 创建底部滚动视图
    self.mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width * title_arr.count, 0);
    _mainScrollView.backgroundColor = [UIColor clearColor];
    // 开启分页
    _mainScrollView.pagingEnabled = YES;
    // 没有弹簧效果
    _mainScrollView.bounces = NO;
    // 隐藏水平滚动条
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _mainScrollView.delegate = self;
    [self.view addSubview:_mainScrollView];
    
    UIViewController *oneVC = [[UIViewController alloc] init];
    oneVC.view.backgroundColor =  [UIColor redColor];
    [self.mainScrollView addSubview:oneVC.view];
    [self addChildViewController:oneVC];
    
}
-(void)LXSegmentControl:(TWSegmentControl *)segmentControl didSelectBtnAtIndex:(NSInteger)index
{
    // 1 计算滚动的位置
    CGFloat offsetX = index * self.view.frame.size.width;
    self.mainScrollView.contentOffset = CGPointMake(offsetX, 0);
    
    // 2.给对应位置添加对应子控制器
    [self showVc:index];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    // 1.添加子控制器view
    [self showVc:index];
    
    // 2.把对应的标题选中
    [self.segmentControl titleBtnSelectedWithScrollView:scrollView];
}

// 显示控制器的view
- (void)showVc:(NSInteger)index {
    
    CGFloat offsetX = index * self.view.frame.size.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    vc.view.backgroundColor =  [UIColor redColor];
    [self.mainScrollView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)setupChildViewController
{
    // 精选啊啊哈哈儿很听话
    UIViewController *oneVC = [[UIViewController alloc] init];
    [self addChildViewController:oneVC];
    
    // 电视剧
    UIViewController *twoVC = [[UIViewController alloc] init];
    [self addChildViewController:twoVC];
    
    // 电影
    UIViewController *threeVC = [[UIViewController alloc] init];
    [self addChildViewController:threeVC];
    
    // 综艺
    UIViewController *fourVC = [[UIViewController alloc] init];
    [self addChildViewController:fourVC];
    
    // NBA
    UIViewController *fiveVC = [[UIViewController alloc] init];
    [self addChildViewController:fiveVC];
    
    // 新闻
    UIViewController *sixVC = [[UIViewController alloc] init];
    [self addChildViewController:sixVC];
    
    // 娱乐
    UIViewController *sevenVC = [[UIViewController alloc] init];
    [self addChildViewController:sevenVC];
    
    // 音乐
    UIViewController *eightVC = [[UIViewController alloc] init];
    [self addChildViewController:eightVC];
    
    // 网络电视
    UIViewController *nineVC = [[UIViewController alloc] init];
    [self addChildViewController:nineVC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
