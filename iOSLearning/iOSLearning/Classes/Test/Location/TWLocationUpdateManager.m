//
//  TWLocationUpdateManager.m
//  iOSLearning
//
//  Created by tang on 16/12/29.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWLocationUpdateManager.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManager.h>

@interface TWLocationUpdateManager()<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *standardlocationManager;
@property (strong, nonatomic) NSDate *lastTimestamp;

@end

@implementation TWLocationUpdateManager

+ (instancetype)sharedStandardManager
{
    static TWLocationUpdateManager *location = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[self alloc]initStandard];
    });
    return location;
}

- (id)initStandard
{
    if(self =[super init]){
        self.standardlocationManager = [[CLLocationManager alloc]init];
        self.standardlocationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.standardlocationManager.delegate = self;
        self.standardlocationManager.pausesLocationUpdatesAutomatically = NO;
        if([[[UIDevice currentDevice]systemVersion]floatValue] >= 8){
            [self.standardlocationManager requestAlwaysAuthorization];
        }
        if([[[UIDevice currentDevice]systemVersion]floatValue]>9){
            self.standardlocationManager.allowsBackgroundLocationUpdates = NO;
        }
    }
    return self;
}

- (void)startStandardUpdatingLocation
{
    [self.standardlocationManager startUpdatingLocation];
}

- (void)stopStandardUpdatingLocation
{
    [self.standardlocationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *mostRecentLocation = locations.lastObject;
    NSLog(@"上传%@",  mostRecentLocation);
}

@end
