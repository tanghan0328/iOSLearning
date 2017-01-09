//
//  Student+CoreDataProperties.h
//  iOSLearning
//
//  Created by tang on 17/1/9.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSNumber *aum;
@property (nullable, nonatomic, copy) NSDate *brithday;
@property (nullable, nonatomic, copy) NSString *descstudent;
@property (nullable, nonatomic, copy) NSNumber *id;
@property (nullable, nonatomic, copy) NSString *stuname;
@property (nullable, nonatomic, copy) NSNumber *sex;
@property (nullable, nonatomic, copy) NSString *ceshi;

@end

NS_ASSUME_NONNULL_END
