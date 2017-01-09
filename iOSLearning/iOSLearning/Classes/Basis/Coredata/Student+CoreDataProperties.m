//
//  Student+CoreDataProperties.m
//  iOSLearning
//
//  Created by tang on 17/1/9.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic aum;
@dynamic brithday;
@dynamic descstudent;
@dynamic id;
@dynamic stuname;
@dynamic sex;
@dynamic ceshi;

@end
