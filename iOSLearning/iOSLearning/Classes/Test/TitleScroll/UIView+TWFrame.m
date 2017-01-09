//
//  UIView+TWFrame.m
//  iOSLearning
//
//  Created by tang on 17/1/9.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "UIView+TWFrame.h"

@implementation UIView (TWFrame)

- (void)setX:(CGFloat)x{
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGFloat x = self.frame.origin.x;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height{
    CGFloat x = self.frame.origin.x;
    CGFloat width = self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    self.frame = CGRectMake(x, y, width, height);
}

- (CGFloat)height{
    return self.frame.size.height;
}
- (CGFloat)centerX{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)CenterX{
    CGPoint center = self.center;
    center.x = CenterX;
    self.center = center;
}

@end
