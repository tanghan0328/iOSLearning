//
//  Grade+CoreDataProperties.m
//  iOSLearning
//
//  Created by tang on 17/1/9.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "Grade+CoreDataProperties.h"

@implementation Grade (CoreDataProperties)

+ (NSFetchRequest<Grade *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Grade"];
}

@dynamic name;
@dynamic number;

@end
