//
//  TWUserModel.h
//  iOSLearning
//
//  Created by tang on 16/11/30.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef enum
//{
//    UserSexMan,
//    UserSexWoman
//}UserSex;
//
//@interface UserModel : NSObject
//
//@property (nonatomic, copy)   NSString *name;
//@property (nonatomic, assign) NSUInteger age;
//@property (nonatomic, assign) UserSex sex;
//
//- (instancetype)initWithUserName:(NSString *)name age:(NSUInteger)age;
//- (void)doLogin;

typedef NS_ENUM(NSInteger,TWUserGender)
{
    TWUserGenderMan,
    TWUserGenderWoman
};

@interface TWUserModel : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign) TWUserGender sex;

//- (instancetype)initWithUserName:(NSString *)name age:(NSUInteger)age;
+ (instancetype)modelWithIdentifier:(NSString *)identifier;
- (void)TWLogin;

@end
