//
//  TWSignatureViewController.m
//  iOSLearning
//
//  Created by tang on 16/6/12.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWSignatureViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "AFNetworking.h"

@interface TWSignatureViewController ()

@end

@implementation TWSignatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self networkWithData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ---- 网络数据请求 -----

-(void)networkWithData{
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer  = [AFHTTPResponseSerializer serializer];
    
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    //生成签名(用字典接受)
    NSDictionary *pkiDic = [self md5String];
    
    NSString *sign = pkiDic[@"PKI"];//签名
    
    NSString *timestamp = pkiDic[@"time"];//时间戳
    
    //设置请求参数(你看 token那个字符串根本就没出现在请求参数当中!!!!)
    NSDictionary *parameters = @{
                                 @"time":@"2016-05-27",
                                 @"sign":sign,
                                 @"timestamp":timestamp
                                 };
    
    [manager POST:@"http://192.168.1.150:8080/erp/warehouse" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (nil != responseObject) {
            
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            if ([resultDic[@"result"]isEqualToString:@"0"]) {
                
                NSLog(@"签名正确!");
                
            }else{
                NSLog(@"签名不正确!");
                
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"未知错误");
    }];
    
}

- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

//加密规则:拼接token和当前时间戳,连续进行三次MD5加密
-(NSDictionary *)md5String
{
    NSString *token = @"DIFJSOYIMVCPAGUI";//token不需要作为参数进行网络传输
    
    //获取当前时间转化Wie时间戳
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%0.0f", a];
    
    NSString *md5mystr = [self md5:[NSString stringWithFormat:@"%@%@",token,timeString]];
    
    NSString *md5mystr2 = [self md5:md5mystr];
    
    NSString *md5mystr3 = [self md5:md5mystr2];
    
    
    //time为当前的时间戳,PKI为签名字符串
    NSDictionary *md5Dic = @{
                             @"time":timeString,
                             @"PKI":md5mystr3
                             };
    
    return md5Dic;
}

@end
