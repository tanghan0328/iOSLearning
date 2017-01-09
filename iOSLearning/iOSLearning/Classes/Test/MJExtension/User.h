//
//  User.h
//  iOSLearning
//
//  Created by tang on 17/1/5.
//  Copyright © 2017年 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef enum {
//    SexMale,
//    SexFemale
//} Sex;

typedef NS_ENUM(NSInteger, Sex)
{
    SexMale,
    SexFemale
};

@interface User : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *icon;
@property (assign, nonatomic) unsigned int age;
@property (copy, nonatomic) NSString *height;
@property (strong, nonatomic) NSNumber *money;
@property (assign, nonatomic) Sex sex;
@property (assign, nonatomic, getter=isGay) BOOL gay;

@end
