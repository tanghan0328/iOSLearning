//
//  TWUtility.h
//  iOSLearning
//
//  Created by tang tang on 2023/9/7.
//  Copyright © 2023 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TWUtility : NSObject

+ (BOOL)screenHasNotch;
+ (NSString *)platform;
+ (NSString *)getDeviceName;
/**
 DeviceInfo：获取当前设备的 用户自定义的别名，例如：库克的 iPhone 9
 
 @return 当前设备的 用户自定义的别名，例如：库克的 iPhone 9
 */
+ (NSString *)iphoneName;

/**
 DeviceInfo：获取当前设备的 系统名称，例如：iOS 13.1
 
 @return 当前设备的 系统名称，例如：iOS 13.1
 */
+ (NSString *)iphoneSystemVersion;

//获取bundle id
+ (NSString *)bundleIdentifier;

//获取App版本号
+ (NSString *)bundleVersion;

//获取App版本Code
+ (NSString *)bundleShortVersionString;


@end

NS_ASSUME_NONNULL_END
