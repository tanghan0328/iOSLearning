//
//  UIColor+TWColor.m
//  iOSLearning
//
//  Created by tang tang on 2023/9/6.
//  Copyright © 2023 tang. All rights reserved.
//

#import "UIColor+TWColor.h"

@implementation UIColor (TWColor)

+ (UIColor *)colorWithHexString:(NSString *)color{
    return [self colorWithHexString:color alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    //NSLog(@"%d %d %d",r,g,b);
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+ (UIColor *)getStatusColorByStatus:(NSString *)status
{
    if(!status || ![status isKindOfClass:[NSString class]] || status.length ==0){
        return [UIColor colorWithHexString:@"119944"];
    }
    NSArray *statusArray =  @[@"清算",@"停业",@"撤销",@"已告解散",@"解散",@"废止",@"歇业",@"不再是独",@"接管",@"破产",@"清理",@"重整",@"停工",@"证书废止",@"证书过期",@"冻结",@"注销中",@"未通过"];
    if ([status containsString:@"吊销"] ||[status containsString:@"注销"] || [statusArray containsObject:status]) {
        return [UIColor colorWithHexString:@"f5544a"];
    }else{
        return [UIColor colorWithHexString:@"119944"];
    }
}

@end
