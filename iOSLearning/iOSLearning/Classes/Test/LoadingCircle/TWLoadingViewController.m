//
//  TWLoadingViewController.m
//  iOSLearning
//
//  Created by tang on 16/12/6.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWLoadingViewController.h"
#import "TWLoadingCircleView.h"

@interface TWLoadingViewController ()

@property (nonatomic, strong) UITextView *label;
@property (nonatomic, strong) TWLoadingCircleView *circleView;

@end

@implementation TWLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _circleView = [[TWLoadingCircleView alloc]initWithFrame:(CGRect){(self.view.bounds.size.width - 100) * 0.5,100,100,100}];
    [self.view addSubview:_circleView];
    
    _label = [[UITextView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 -100, SCREEN_HEIGHT/2 -40, 200, 40)];
    _label.backgroundColor = [UIColor grayColor];
    _label.keyboardType = UIKeyboardTypeNumberPad;
    _label.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_label];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 -100, SCREEN_HEIGHT/2, 200, 40)];
    [button setTitle:@"启动" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [button addTarget:self action:@selector(onRateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
}


- (void)onRateButtonClick:(id)sender
{
     [_label resignFirstResponder];
    if(_label.text.length >0){
        _circleView.rate = [_label.text integerValue];
        [_circleView startAnimation];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"请输入圆的数据（0~100）" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_label resignFirstResponder];
}

@end
