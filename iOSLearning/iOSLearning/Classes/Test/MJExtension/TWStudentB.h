//
//  TWStudentB.h
//  iOSLearning
//
//  Created by tang on 17/1/5.
//  Copyright © 2017年 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bag : NSObject

@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) double price;

@end

@interface TWStudentB : NSObject

@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *nowName;
@property (copy, nonatomic) NSString *oldName;
@property (copy, nonatomic) NSString *nameChangedTime;
@property (strong, nonatomic) Bag *bag;

@end
