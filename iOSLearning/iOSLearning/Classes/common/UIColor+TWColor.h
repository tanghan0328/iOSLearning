//
//  UIColor+TWColor.h
//  iOSLearning
//
//  Created by tang tang on 2023/9/6.
//  Copyright © 2023 tang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (TWColor)

+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
//根据status的名称获取标签的颜色
+ (UIColor *)getStatusColorByStatus:(NSString *)status;

@end

NS_ASSUME_NONNULL_END
