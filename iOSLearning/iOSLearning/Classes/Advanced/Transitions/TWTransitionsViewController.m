//
//  TWTransitionsViewController.m
//  iOSLearning
//
//  Created by tang on 16/10/24.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWTransitionsViewController.h"

@interface TWTransitionsViewController ()
{
    UISegmentedControl *segment;
    UIView *_leftView;
    UIView *_rigthView;
}
@end

@implementation TWTransitionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addNavigation];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//    [super viewWillAppear:animated];
//}
//
- (void)viewWillDisappear:(BOOL)animated {
    for(UIView *view in self.navigationController.navigationBar.subviews){
        if ([view isKindOfClass:[UISegmentedControl class]]) {
            [view removeFromSuperview];
        }
    }
    [super viewWillDisappear:animated];
}

- (void)addNavigation
{
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor purpleColor];
    bar.tintColor = [UIColor colorWithRed:0.8 green:0.5 blue:1 alpha:1];
    bar.translucent = NO;
    
    NSArray *array = [NSArray arrayWithObjects:@"订单",@"商品", nil];
    segment = [[UISegmentedControl alloc]initWithItems:array];
    segment.frame = CGRectMake(SCREEN_WIDTH/2 - 226/4, 7, 226/2, 30);
    [segment addTarget:self action:@selector(selectIndex:) forControlEvents:UIControlEventValueChanged];
    segment.layer.borderColor = [UIColor whiteColor].CGColor;
    segment.tintColor = [UIColor orangeColor];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0f],@"NSFontAttributeName",nil];
    [segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    segment.selectedSegmentIndex = 0;
    [self.navigationController.navigationBar addSubview:segment];
    
    
    _leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT -64)];
    _leftView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_leftView];
    
    
    _rigthView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    _rigthView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_rigthView];
    
    [self.view bringSubviewToFront:_leftView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)selectIndex:(UISegmentedControl *)segmentor
{
    if(segmentor.selectedSegmentIndex == 0){
        [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
        [self.view bringSubviewToFront:_leftView];
    }else{
        [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
        [self.view bringSubviewToFront:_rigthView];
    }
    
}

- (void)animationWithView:(UIView *)view WithAnimationTransition:(UIViewAnimationTransition) transtion
{
    [UIView animateWithDuration:0.5f animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transtion forView:view cache:YES];
    }];
}


@end
