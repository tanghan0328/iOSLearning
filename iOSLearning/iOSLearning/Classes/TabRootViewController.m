//
//  TabRootViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/6.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TabRootViewController.h"
#import "TestViewController.h"
#import "AdvanceViewController.h"
#import "TableListViewController.h"
#import "DevelopViewController.h"

@interface TabRootViewController ()<UITabBarControllerDelegate>


@end

@implementation TabRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithTab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithTab
{
    TestViewController *first = [[TestViewController alloc]init];
    first.title = @"测试";
    UINavigationController *fNav = [[UINavigationController alloc]initWithRootViewController:first];
    fNav.navigationBarHidden = YES;
    UIImage * unselected1= [[UIImage imageNamed:@"btn_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selected1 = [[UIImage imageNamed:@"btn_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *firstTabBar = [[UITabBarItem alloc]initWithTitle:@"测试" image:unselected1 selectedImage:selected1];
    [firstTabBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [firstTabBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    first.tabBarItem = firstTabBar;
    
    AdvanceViewController *second = [[AdvanceViewController alloc]init];
    second.title = @"进阶";
    UINavigationController *sNav = [[UINavigationController alloc]initWithRootViewController:second];
    UIImage * unselected2= [[UIImage imageNamed:@"btn_column_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selected2 = [[UIImage imageNamed:@"btn_column_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *secondTabBar = [[UITabBarItem alloc]initWithTitle:@"进阶" image:unselected2 selectedImage:selected2];
    [secondTabBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [secondTabBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    second.tabBarItem = secondTabBar;
    
    DevelopViewController *third = [[DevelopViewController alloc]init];
    
    UINavigationController *tNav = [[UINavigationController alloc]initWithRootViewController:third];
    UIImage * unselected3= [[UIImage imageNamed:@"btn_live_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selected3 = [[UIImage imageNamed:@"btn_live_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *thirdTabBar = [[UITabBarItem alloc]initWithTitle:@"开发" image:unselected3 selectedImage:selected3];
    [thirdTabBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [thirdTabBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    thirdTabBar.badgeValue = @"123";
    third.tabBarItem = thirdTabBar;
    
    TableListViewController *forth =[[TableListViewController alloc]init];
    UINavigationController *forNav = [[UINavigationController alloc]initWithRootViewController:forth];
    UIImage * unselected4 = [[UIImage imageNamed:@"btn_user_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selected4 = [[UIImage imageNamed:@"btn_user_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *forthTabBar = [[UITabBarItem alloc]initWithTitle:@"基础" image:unselected4 selectedImage:selected4];
    [forthTabBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [forthTabBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    forthTabBar.badgeValue = @"New";
    forth.tabBarItem = forthTabBar;
    
    
    self.viewControllers = [[NSArray alloc]initWithObjects:forNav,tNav,sNav,fNav, nil];
    //self.tabBar.translucent = NO;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    self.tabBar.hidden = NO;
}

@end
