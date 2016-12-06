//
//  TWLoadingCircleView.m
//  iOSLearning
//
//  Created by tang on 16/12/6.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWLoadingCircleView.h"

#define LineWidth 4

@interface TWLoadingCircleView ()
{
    CGFloat _startAngle; // 开始的角度
    NSInteger _startRate;
}
//   半径r
@property(nonatomic,assign) CGFloat rWidth;
//    显示圆的边缘图层
@property(nonatomic,strong) CAShapeLayer *shapeLayer;
//    定时器
@property(nonatomic,strong) CADisplayLink *displayLink;
//     显示圆的路径
@property(nonatomic,strong) UIBezierPath *bPath;
//      显示Lab
@property (nonatomic, strong) UILabel *rateLbl;

@end

@implementation TWLoadingCircleView

-(instancetype)initWithFrame:(CGRect)frame
{
    self =  [super initWithFrame:frame];
    if (self) {
        _startAngle = -90; // 从圆的最顶部开始
        _rWidth = frame.size.width;
        _bPath = [UIBezierPath bezierPath];
        // 先画一个底部的圆
        [self configBgCircle];
        // 配置CAShapeLayer
        [self configShapeLayer];
        // 配置CADisplayLink
        [self configDisplayLink];
        // label
        [self configLab];
    }
    return self;
    
}

#pragma mark - 底下灰色的圆(辅助圆)
- (void)configBgCircle
{
    UIBezierPath *bPath = [UIBezierPath bezierPathWithArcCenter:(CGPoint){self.bounds.size.width *0.5,self.bounds.size.height *0.5} radius:_rWidth * 0.5 startAngle:0 endAngle:360 clockwise:YES];
    CAShapeLayer *shaperLayer = [CAShapeLayer layer];
    shaperLayer.lineWidth = LineWidth;
    shaperLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    shaperLayer.fillColor = nil;
    shaperLayer.path = bPath.CGPath;
    [self.layer addSublayer:shaperLayer];
}

#pragma mark 配置CAShaperLayer(用于显示圆)
- (void)configShapeLayer
{
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.lineWidth = LineWidth;
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    _shapeLayer.fillColor = nil;
    [self.layer addSublayer:_shapeLayer];
}

#pragma mark 配置CADisplayLink
- (void)configDisplayLink
{
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawCircle)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    _displayLink.paused = YES; //  默认暂停
}

#pragma mark - 中间显示数字的Label
- (void)configLab
{
    CGFloat rateLabX = 10;
    CGFloat rateLabW = self.frame.size.width - 2 * rateLabX;
    CGFloat rateLabH = 40;
    CGFloat rateLabY = (self.frame.size.height - rateLabH) * 0.5;
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(rateLabX, rateLabY, rateLabW, rateLabH)];
    _rateLbl = lab;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor blackColor];
    lab.text = @"0%";
    [self addSubview:lab];
}
#pragma mark - event response
- (void)drawCircle
{
    if (_startRate >= _rate) {
        _bPath = [UIBezierPath bezierPath];
        _displayLink.paused = YES;
        return;
    }
    _startRate ++;
    _rateLbl.text = [NSString stringWithFormat:@"%ld%%",_startRate];
    
    [_bPath addArcWithCenter:CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5) radius:_rWidth * 0.5  startAngle:(M_PI /180.0) *_startAngle endAngle:(M_PI /180.0) *(_startAngle + 3.6) clockwise:YES];
    _shapeLayer.path = _bPath.CGPath;
    _startAngle += 3.6;
}
#pragma mark - public methods
- (void)startAnimation
{
    if (_displayLink.paused == YES) {
        _startAngle = -90;
        _startRate = 0;
        _displayLink.paused = NO;
    }
}

#pragma mark - getter/setter
- (void)setRate:(NSInteger)rate
{
    if (rate <= 0 || rate >100) {
        rate = 100;
    }else{
        _rate = rate;
    }
}
@end
