//
//  Grade+CoreDataProperties.h
//  iOSLearning
//
//  Created by tang on 16/4/5.
//  Copyright © 2016年 tang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Grade.h"

NS_ASSUME_NONNULL_BEGIN

@interface Grade (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *number;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
