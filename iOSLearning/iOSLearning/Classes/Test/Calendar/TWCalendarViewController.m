//
//  TWCalendarViewController.m
//  iOSLearning
//
//  Created by tang on 16/11/28.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWCalendarViewController.h"
#import <EventKit/EventKit.h>
#import <UIKit/UIKit.h>

@interface TWCalendarViewController ()

@end

@implementation TWCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TWEventCalendar *calendar = [TWEventCalendar sharedEventCalendar];
    NSDate *startDate = [NSDate dateWithTimeIntervalSinceNow:10];
    NSDate *endDate = [NSDate dateWithTimeIntervalSinceNow:30];
    [calendar createEventCalendarTitle:@"测试" location:@"我在北京" startDate:startDate endDate:endDate allDay:NO alarmArray:@[@"2",@"4"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
