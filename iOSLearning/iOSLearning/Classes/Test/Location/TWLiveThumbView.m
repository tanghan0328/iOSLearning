//
//  TWLiveThumbView.m
//  iOSLearning
//
//  Created by tang on 16/12/29.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWLiveThumbView.h"

@implementation TWLiveThumbView

- (void)drawRect:(CGRect)rect {
//    [self.strokeColor setStroke];
//    [self.fillColor setFill];
    
    CGFloat drawingPadding = 4.0;
    CGFloat curveRadius = floor((CGRectGetWidth(rect) - 2*drawingPadding) / 4.0);
    
    //贝赛尔曲线
    UIBezierPath *heartPath = [UIBezierPath bezierPath];
    //爱心的最底部的定点
    CGPoint tipLocation =  CGPointMake(floor(CGRectGetWidth(rect) / 2.0), CGRectGetHeight(rect) - drawingPadding);
    //曲线的起点
    [heartPath moveToPoint:tipLocation];
    
    //Move to top left start of curve
    CGPoint topLeftCurveStart = CGPointMake(drawingPadding, floor(CGRectGetHeight(rect) / 2.4));
    
    [heartPath addQuadCurveToPoint:topLeftCurveStart controlPoint:CGPointMake(topLeftCurveStart.x, topLeftCurveStart.y + curveRadius)];
    
    //Create top left curve
    [heartPath addArcWithCenter:CGPointMake(topLeftCurveStart.x + curveRadius, topLeftCurveStart.y) radius:curveRadius startAngle:M_PI endAngle:0 clockwise:YES];
    
    //Create top right curve
    CGPoint topRightCurveStart = CGPointMake(topLeftCurveStart.x + 2*curveRadius, topLeftCurveStart.y);
    [heartPath addArcWithCenter:CGPointMake(topRightCurveStart.x + curveRadius, topRightCurveStart.y) radius:curveRadius startAngle:M_PI endAngle:0 clockwise:YES];
    
    //Final curve to bottom heart tip
    CGPoint topRightCurveEnd = CGPointMake(topLeftCurveStart.x + 4*curveRadius, topRightCurveStart.y);
    [heartPath addQuadCurveToPoint:tipLocation controlPoint:CGPointMake(topRightCurveEnd.x, topRightCurveEnd.y + curveRadius)];
    
    [heartPath fill];
    
    heartPath.lineWidth = 1;
    heartPath.lineCapStyle = kCGLineCapRound;
    heartPath.lineJoinStyle = kCGLineCapRound;
    [heartPath stroke];
    
}

@end
