//
//  TWDateViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/21.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWDateViewController.h"

@interface TWDateViewController ()

@property (nonatomic,retain) NSString *name;

@end

@implementation TWDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithDateTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithDateTime
{
    //
    NSDate *date = [NSDate date];
    NSLog(@"%@", date);
    
    //获取到40年前的日期
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:-40];
    NSDate *birthDate = [gregorian dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
    
    NSLog(@"获取到40年前的日期 == %@",birthDate );
    
    NSDate *dateTime = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd/MM/yyyy hh:mm:ss aaa"];
    NSLog(@"curr=%@, dateFormate=%@", [df stringFromDate:dateTime], df.dateFormat);
}

@end
