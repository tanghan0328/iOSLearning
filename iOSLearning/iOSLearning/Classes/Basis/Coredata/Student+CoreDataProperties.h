//
//  Student+CoreDataProperties.h
//  iOSLearning
//
//  Created by tang on 16/4/5.
//  Copyright © 2016年 tang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *sex;
@property (nullable, nonatomic, retain) NSDate *brithday;
@property (nullable, nonatomic, retain) NSNumber *aum;

@end

NS_ASSUME_NONNULL_END
