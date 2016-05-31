//
//  NSString+AES.h
//  iOSLearning
//
//  Created by tang on 16/4/1.
//  Copyright © 2016年 tang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import "NSData+AES.h"

@interface NSString (AES)

//加密
- (NSString *) AES256_Encrypt:(NSString *)key;

//解密
- (NSString *) AES256_Decrypt:(NSString *)key;

@end
