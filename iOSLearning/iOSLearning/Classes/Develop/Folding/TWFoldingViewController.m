//
//  TWFoldingViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/1.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWFoldingViewController.h"

@interface TWFoldingViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *topView;
@property (strong, nonatomic) IBOutlet UIImageView *bottomView;
@property (strong, nonatomic) IBOutlet UIView *dragView;

@property (weak, nonatomic) CAGradientLayer *gradientL;
@end

@implementation TWFoldingViewController

//- (CAGradientLayer *)gradoentL
//{
//    if(_gradientL == nil){
//
//    }
//    return _gradientL;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor grayColor];
    [self initWithImage];
}

- (void)initWithImage{
    _topView.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    _topView.layer.anchorPoint = CGPointMake(0.5, 1);
    
    _bottomView.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    _bottomView.layer.anchorPoint = CGPointMake(0.5, 0);
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [_dragView addGestureRecognizer:pan];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = _bottomView.bounds;
    gradientLayer.opacity = 0;
    gradientLayer.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor];
    _gradientL = gradientLayer;
    [_bottomView.layer addSublayer:self.gradientL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    //获取当前的偏移量
    CGPoint transP = [pan translationInView:_dragView];
    //旋转topView的角度 往下逆时针旋转
    CGFloat angle = -transP.y/200 * M_PI;
    
    CATransform3D transFrom = CATransform3DIdentity;
    //增加旋转的立体感，近大远小
    transFrom.m34 = -1 / 500.0;
    transFrom = CATransform3DRotate(transFrom, angle, 1, 0, 0);
    
    _topView.layer.transform = transFrom;
    //设置阴影效果
    // 设置阴影效果
    _gradientL.opacity = transP.y * 1 / 200.0;
    if(pan.state == UIGestureRecognizerStateEnded){
        //弹簧效果
        [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:10  options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
            _topView.layer.transform = CATransform3DIdentity;
            _gradientL.opacity = 0;
        } completion:^(BOOL finished) {

        }];
    }
}

@end
