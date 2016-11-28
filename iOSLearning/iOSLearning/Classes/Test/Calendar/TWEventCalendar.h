//
//  TWEventCalendar.h
//  iOSLearning
//
//  Created by tang on 16/11/28.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWEventCalendar : NSObject

+ (instancetype)sharedEventCalendar;

/**
 *  将App事件添加到系统日历提醒事项，实现闹铃提醒的功能
 *
 *  @param title      事件标题
 *  @param location   事件位置
 *  @param startDate  开始时间
 *  @param endDate    结束时间
 *  @param allDay     是否全天
 *  @param alarmArray 闹钟集合
 *  @param block      回调方法
 */
- (void)createEventCalendarTitle:(NSString *)title location:(NSString *)location startDate:(NSDate *)startDate endDate:(NSDate *)endDate allDay:(BOOL)allDay alarmArray:(NSArray *)alarmArray;

@end
