//
//  TWGtoView.m
//  iOSLearning
//
//  Created by tang on 16/5/31.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWGtoView.h"
@interface TWGtoView()

@property (nonatomic, weak)UIView *smallCircleView;
@property (nonatomic, assign) CGFloat oriSmallRadius;
@property (nonatomic, weak) CAShapeLayer *shapeLayer;

@end

@implementation TWGtoView

//懒加载shapelayer
- (CAShapeLayer *)shapeLayer
{
    if(_shapeLayer == nil){
        CAShapeLayer *layer = [CAShapeLayer layer];
        _shapeLayer = layer;
        layer.fillColor = self.backgroundColor.CGColor;
        [self.superview.layer insertSublayer:layer below:self.layer];
    }
    return _shapeLayer;
}

- (UIView *)smallCircleView
{
    if(_smallCircleView == nil){
        UIView *smallview = [[UIView alloc]init];
        smallview.backgroundColor = self.backgroundColor;
        _smallCircleView = smallview;
        [self.superview insertSubview:smallview belowSubview:self];
    }
    return _smallCircleView;
}

//初始化调用的方法
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if(self){
//        [self setUp];
//        NSLog(@"%s",__func__);
//    }
//    return self;
//}

- (void)awakeFromNib
{
    //打印方法名称
    NSLog(@"%s",__func__);
    [self setUp];
}

- (void)setUp
{
    CGFloat w = self.bounds.size.width;
    _oriSmallRadius = w/2;
    self.layer.cornerRadius = w/2;
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    //设置小圆的位置和尺寸
    self.smallCircleView.center = self.center;
    self.smallCircleView.bounds = self.bounds;
    self.smallCircleView.layer.cornerRadius = w/2;
    
}

#define kMaxDistance 80

- (void)pan:(UIPanGestureRecognizer *)pan
{
    self.smallCircleView.hidden = NO;
    //获取受制的偏移量
    CGPoint transP = [pan translationInView:self];
    //修改大圆的中心
    CGPoint center = self.center;
    center.x += transP.x;
    center.y += transP.y;
    self.center = center;
    //复位
    [pan setTranslation:CGPointZero inView:self];
    //显示后面的圆 后面圆的半径 随着两个圆心的距离不断增加而减少
    //计算圆心的距离
    CGFloat d = [self circleCenterDistanceWidthBigCircleCenter:self.center smallCircleCenter:self.smallCircleView.center];
    //设置小圆的半径
    CGFloat smallCircleRadius = _oriSmallRadius - d/10;
    //设置小圆的尺寸
    self.smallCircleView.bounds = CGRectMake(0, 0, smallCircleRadius*2, smallCircleRadius*2);
    self.smallCircleView.layer.cornerRadius = smallCircleRadius;
    if(d > kMaxDistance){
        self.smallCircleView.hidden = YES;
        [self.shapeLayer removeFromSuperlayer];
        self.shapeLayer = nil;
    }else if(d >0 && d<= kMaxDistance){
        self.shapeLayer.path = [self pathWithBigCirCleView:self smallCirCleView:self.smallCircleView].CGPath;
    }
    //手指抬起的时候还原
    if(pan.state == UIGestureRecognizerStateEnded){
        [self.shapeLayer removeFromSuperlayer];
        self.shapeLayer = nil;
        if(d > kMaxDistance){
            // 展示gif动画
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
            NSMutableArray *arrM = [NSMutableArray array];
            for (int i = 1; i < 9; i++) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
                [arrM addObject:image];
            }
            imageView.animationImages = arrM;
            
            imageView.animationRepeatCount = 1;
            
            imageView.animationDuration = 0.5;
            
            [imageView startAnimating];
            
            [self addSubview:imageView];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                //删除图片view
                for(UIView *mylabelview in [self subviews])
                {
                    if ([mylabelview isKindOfClass:[UIImageView class]]) {
                        [mylabelview removeFromSuperview];
                    }
                }
            });

            self.center = self.smallCircleView.center;
            self.smallCircleView.hidden = YES;
            self.layer.cornerRadius = self.bounds.size.width/2;
        }else{
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.2f initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                self.center = self.smallCircleView.center;
            } completion:^(BOOL finished) {
                self.smallCircleView.hidden = YES;
                self.layer.cornerRadius = self.bounds.size.width/2;
            }];
        }
    }
    
}

//计算圆心的距离
- (CGFloat)circleCenterDistanceWidthBigCircleCenter:(CGPoint)bigCircleCenter smallCircleCenter:(CGPoint)smallCircleCenter
{
    CGFloat offerX = bigCircleCenter.x  - smallCircleCenter.x;
    CGFloat offerY = bigCircleCenter.y - smallCircleCenter.y;
    
    return sqrt(offerX*offerX + offerY*offerY);
}

// 描述两圆之间一条矩形路径
- (UIBezierPath *)pathWithBigCirCleView:(UIView *)bigCirCleView  smallCirCleView:(UIView *)smallCirCleView
{
    CGPoint bigCenter = bigCirCleView.center;
    CGFloat x2 = bigCenter.x;
    CGFloat y2 = bigCenter.y;
    CGFloat r2 = bigCirCleView.bounds.size.width / 2;
    
    CGPoint smallCenter = smallCirCleView.center;
    CGFloat x1 = smallCenter.x;
    CGFloat y1 = smallCenter.y;
    CGFloat r1 = smallCirCleView.bounds.size.width / 2;

    // 获取圆心距离
    CGFloat d = [self circleCenterDistanceWidthBigCircleCenter:bigCenter smallCircleCenter:smallCenter];
    
    CGFloat sinθ = (x2 - x1) / d;
    
    CGFloat cosθ = (y2 - y1) / d;
    
    // 坐标系基于父控件
    CGPoint pointA = CGPointMake(x1 - r1 * cosθ , y1 + r1 * sinθ);
    CGPoint pointB = CGPointMake(x1 + r1 * cosθ , y1 - r1 * sinθ);
    CGPoint pointC = CGPointMake(x2 + r2 * cosθ , y2 - r2 * sinθ);
    CGPoint pointD = CGPointMake(x2 - r2 * cosθ , y2 + r2 * sinθ);
    CGPoint pointO = CGPointMake(pointA.x + d / 2 * sinθ , pointA.y + d / 2 * cosθ);
    CGPoint pointP =  CGPointMake(pointB.x + d / 2 * sinθ , pointB.y + d / 2 * cosθ);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    // A
    [path moveToPoint:pointA];
    // AB
    [path addLineToPoint:pointB];
    // 绘制BC曲线
    [path addQuadCurveToPoint:pointC controlPoint:pointP];
    // CD
    [path addLineToPoint:pointD];
    // 绘制DA曲线
    [path addQuadCurveToPoint:pointA controlPoint:pointO];
    
    return path;
}

@end
