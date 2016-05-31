//
//  TWUser.h
//  iOSLearning
//
//  Created by tang on 16/5/9.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWUser : NSObject

@property (nonatomic, assign) int userID;
@property (nonatomic, copy) NSString *name;

- (NSDictionary *) encodedItem;
@end
