//
//  TWUser.m
//  iOSLearning
//
//  Created by tang on 16/5/9.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWUser.h"

@implementation TWUser

#pragma Used for encoded objects to be able to save to UserDeafaults
- (NSDictionary *) encodedItem
{
    return [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:self.userID ], @"userID",
            self.name, @"name", nil];
}

@end
