//
//  UIImage+TWColor.m
//  iOSLearning
//
//  Created by tang on 16/6/3.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "UIImage+TWColor.h"

@implementation UIImage (TWColor)

+(UIImage*)imageWithColor:(UIColor*) color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
