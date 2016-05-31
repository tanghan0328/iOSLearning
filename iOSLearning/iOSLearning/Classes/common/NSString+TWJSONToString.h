//
//  NSString+TWJSONToString.h
//  iOSLearning
//
//  Created by tang on 16/5/9.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TWJSONToString)

+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;

+(NSString *) jsonStringWithArray:(NSArray *)array;

+(NSString *) jsonStringWithString:(NSString *) string;

+(NSString *) jsonStringWithObject:(id) object;

+(void) jsonTest;

@end
