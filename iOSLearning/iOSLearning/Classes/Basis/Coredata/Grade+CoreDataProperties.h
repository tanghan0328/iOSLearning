//
//  Grade+CoreDataProperties.h
//  iOSLearning
//
//  Created by tang on 17/1/9.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "Grade+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Grade (CoreDataProperties)

+ (NSFetchRequest<Grade *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *number;

@end

NS_ASSUME_NONNULL_END
