//
//  TWFileViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/21.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWFileViewController.h"

@interface TWFileViewController ()

@end

@implementation TWFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithFile
{
    //获得当前硬盘空间
    NSFileManager *fm = [NSFileManager defaultManager];
    NSDictionary *fattributes = [fm attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    
    NSLog(@"容量%lldG",[[fattributes objectForKey:NSFileSystemSize] longLongValue]/1000000000);
    NSLog(@"可用%lldG",[[fattributes objectForKey:NSFileSystemFreeSize] longLongValue]/1000000000);
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *path = @"/1.text";
    NSDictionary *fileDic = [filemanager attributesOfItemAtPath:path error:nil];
    
}

//创建文件
- (void)createPlistFile
{
    NSError *twerror;
    NSFileManager *filemanager = [NSFileManager defaultManager];
    
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    [filemanager createDirectoryAtPath:[NSString stringWithFormat:@"%@/myFolder",NSHomeDirectory()] withIntermediateDirectories:YES attributes:nil error:&twerror];
    
    NSString *myFilePath = [documentsDirectory stringByAppendingPathComponent:@"file2.txt"];
    
    NSString *str = @"测试的字符串的写入";
    [str writeToFile:myFilePath atomically:YES encoding:NSUTF8StringEncoding error:&twerror];
    
    //重命名  需要将文件移动到一个新的路径下
    NSString *filePath2= [documentsDirectory
                          stringByAppendingPathComponent:@"file3.txt"];
    if ([filemanager moveItemAtPath:myFilePath toPath:filePath2 error:&twerror] != YES){
        TWLog(@"移动文件失败，原因为：%@",[twerror localizedDescription])
    }
    TWLog(@"文件地址为：%@",[filemanager contentsOfDirectoryAtPath:documentsDirectory error:&twerror]);
    
    //删除目录下的所有文件
    
    BOOL result = [filemanager removeItemAtPath: [self attchmentFloder] error:&twerror];
    
    TWLog(@"清楚所有的附件  是否成功 %hhd", result);
}

- (NSString *)attchmentFloder
{
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    
    NSString *path = [documents stringByAppendingString:@"Attchments"];
    NSFileManager *manager = [NSFileManager defaultManager];
    if(![manager contentsOfDirectoryAtPath:path error:nil]){
        TWLog(@"没有该文件夹");
        [manager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return path;
}







@end
