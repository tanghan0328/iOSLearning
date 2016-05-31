//
//  TWDrawView.m
//  iOSLearning
//
//  Created by tang on 16/5/30.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWDrawView.h"

@interface TWDrawView ()

@property (nonatomic, strong) UIBezierPath *path;

@property (nonatomic, weak) CALayer *dotLayer;

@property (nonatomic, weak) CAReplicatorLayer *repL;

@end

@implementation TWDrawView

static int _instansCount = 0;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获取touch对象
    UITouch *touch = [touches anyObject];
    //获取当前的触点
    CGPoint point = [touch locationInView:self];
    //设置起点
    [self.path moveToPoint:point];
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self.path addLineToPoint:point];
    [self setNeedsDisplay];
    _instansCount ++;
}

- (void)drawRect:(CGRect)rect
{
    [self.path stroke];
}

- (void)awakeFromNib
{
    //创建复制层
    CAReplicatorLayer *repl = [CAReplicatorLayer layer];
    repl.frame = self.bounds;
    [self.layer addSublayer:repl];
    _repL = repl;
}


- (void)startAnim
{
    if(_path == nil){
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"注意" message:@"请绘制一条线" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
        [alertview show];
    }
    //创建帧动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = _path.CGPath;
    anim.duration = 3;
    anim.repeatCount = MAXFLOAT;
    [self.dotLayer addAnimation:anim forKey:nil];
    //复制子层
    _repL.instanceCount = _instansCount;
    _repL.instanceDelay = 0.2f;
}

- (void)reDraw
{
     // 清空绘图信息
    _path = nil;
    [self setNeedsDisplay];
    // 把图层移除父控件，复制层也会移除。
    [_dotLayer removeFromSuperlayer];
    _dotLayer = nil;
    // 清空子层总数
    _instansCount = 0;
}

- (CALayer *)dotLayer
{
    if(_dotLayer == nil){
        CALayer *layer = [CALayer layer];
        CGFloat wh = 8.0f;
        layer.frame = CGRectMake(0, -1000,wh, wh);
        layer.cornerRadius = wh/2;
        layer.backgroundColor = [UIColor greenColor].CGColor;
        [_repL addSublayer:layer];
        _dotLayer = layer;
    }
    return _dotLayer;
}

- (UIBezierPath *)path
{
    if(_path == nil){
        _path = [UIBezierPath bezierPath];
    }
    return _path;
}
@end
