//
//  TWUtility.m
//  iOSLearning
//
//  Created by tang tang on 2023/9/7.
//  Copyright © 2023 tang. All rights reserved.
//

#import "TWUtility.h"
#import <sys/utsname.h>

@implementation TWUtility

+ (BOOL)screenHasNotch {
    static NSNumber *iPhoneXNumber = nil;
    if (iPhoneXNumber == nil) {
        iPhoneXNumber = @(NO);
        if(@available(iOS 11.0, *)){
            UIWindow *window = [[UIApplication sharedApplication] delegate].window;
            iPhoneXNumber = @(window.safeAreaInsets.bottom > 0);
            if (window == nil) {
                iPhoneXNumber = nil;
            }
        }
    }
    return [iPhoneXNumber boolValue];
}

+ (NSString *)platform {
    static dispatch_once_t one;
    static NSString *platform;
    dispatch_once(&one, ^{
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *platformString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        if (!platform) platform = platformString;
    });
    return platform;
}

+ (NSString *)getDeviceName{
    // 需要#import "sys/utsname.h"
    static dispatch_once_t one;
    static NSString *name;
    dispatch_once(&one, ^{
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        NSDictionary *deviceDictionary = @{
            @"iPhone1,1": @"iPhone 2G",
            @"iPhone1,2": @"iPhone 3G",
            @"iPhone2,1": @"iPhone 3GS",
            @"iPhone3,1": @"iPhone 4",
            @"iPhone3,2": @"iPhone 4",
            @"iPhone3,3": @"iPhone 4",
            @"iPhone4,1": @"iPhone 4S",
            @"iPhone5,1": @"iPhone 5",
            @"iPhone5,2": @"iPhone 5",
            @"iPhone5,3": @"iPhone 5c",
            @"iPhone5,4": @"iPhone 5c",
            @"iPhone6,1": @"iPhone 5s",
            @"iPhone6,2": @"iPhone 5s",
            @"iPhone7,1": @"iPhone 6 Plus",
            @"iPhone7,2": @"iPhone 6",
            @"iPhone8,1": @"iPhone 6s",
            @"iPhone8,2": @"iPhone 6s Plus",
            @"iPhone8,4": @"iPhone SE",
            @"iPhone9,1": @"iPhone 7",
            @"iPhone9,3": @"iPhone 7",
            @"iPhone9,2": @"iPhone 7 Plus",
            @"iPhone9,4": @"iPhone 7 Plus",
            @"iPhone10,1": @"iPhone 8",
            @"iPhone10,4": @"iPhone 8",
            @"iPhone10,2": @"iPhone 8 Plus",
            @"iPhone10,5": @"iPhone 8 Plus",
            @"iPhone10,3": @"iPhone X",
            @"iPhone10,6": @"iPhone X",
            @"iPhone11,8": @"iPhone XR",
            @"iPhone11,2": @"iPhone XS",
            @"iPhone11,4": @"iPhone XS Max",
            @"iPhone11,6": @"iPhone XS Max",
            @"iPhone12,1": @"iPhone 11",
            @"iPhone12,3": @"iPhone 11 Pro",
            @"iPhone12,5": @"iPhone 11 Pro Max",
            @"iPhone12,8": @"iPhone SE 2G",
            @"iPhone13,1": @"iPhone 12 mini",
            @"iPhone13,2": @"iPhone 12",
            @"iPhone13,3": @"iPhone 12 Pro",
            @"iPhone13,4": @"iPhone 12 Pro Max",
            @"iPhone14,4": @"iPhone 13 mini",
            @"iPhone14,5": @"iPhone 13",
            @"iPhone14,2": @"iPhone 13 Pro",
            @"iPhone14,3": @"iPhone 13 Pro Max",
            @"iPhone14,6": @"iPhone SE 3",
            @"iPhone14,7": @"iPhone 14",
            @"iPhone14,8": @"iPhone 14 Plus",
            @"iPhone15,2": @"iPhone 14 Pro",
            @"iPhone15,3": @"iPhone 14 Pro Max",
            @"iPod1,1": @"iPod Touch 1G",
            @"iPod2,1": @"iPod Touch 2G",
            @"iPod3,1": @"iPod Touch 3G",
            @"iPod4,1": @"iPod Touch 4G",
            @"iPod5,1": @"iPod Touch 5G",
            @"iPad1,1": @"iPad 1G",
            @"iPad2,1": @"iPad 2",
            @"iPad2,2": @"iPad 2",
            @"iPad2,3": @"iPad 2",
            @"iPad2,4": @"iPad 2",
            @"iPad2,5": @"iPad Mini 1G",
            @"iPad2,6": @"iPad Mini 1G",
            @"iPad2,7": @"iPad Mini 1G",
            @"iPad3,1": @"iPad 3",
            @"iPad3,2": @"iPad 3",
            @"iPad3,3": @"iPad 3",
            @"iPad3,4": @"iPad 4",
            @"iPad3,5": @"iPad 4",
            @"iPad3,6": @"iPad 4",
            @"iPad4,1": @"iPad Air",
            @"iPad4,2": @"iPad Air",
            @"iPad4,3": @"iPad Air",
            @"iPad4,4": @"iPad Mini 2G",
            @"iPad4,5": @"iPad Mini 2G",
            @"iPad4,6": @"iPad Mini 2G",
            @"iPad4,7": @"iPad Mini 3",
            @"iPad4,8": @"iPad Mini 3",
            @"iPad4,9": @"iPad Mini 3",
            @"iPad5,1": @"iPad Mini 4",
            @"iPad5,2": @"iPad Mini 4",
            @"iPad5,3": @"iPad Air 2",
            @"iPad5,4": @"iPad Air 2",
            @"iPad6,3": @"iPad Pro 9.7",
            @"iPad6,4": @"iPad Pro 9.7",
            @"iPad6,7": @"iPad Pro 12.9",
            @"iPad6,8": @"iPad Pro 12.9",
            @"i386": @"iPhone Simulator",
            @"x86_64": @"iPhone Simulator"};
        name = deviceDictionary[platform];
        if (!name) name = platform;
    });
    return name;
}

+ (NSString *)iphoneName
{
    return [UIDevice currentDevice].name;
}

+ (NSString *)iphoneSystemVersion
{
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)bundleIdentifier
{
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)bundleVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)bundleShortVersionString
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
