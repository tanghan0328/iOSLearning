//
//  TWPlistRWViewController.m
//  iOSLearning
//
//  Created by tang on 16/5/5.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWPlistRWViewController.h"
#import "TWUser.h"
#import "NSString+TWJSONToString.h"

@interface TWPlistRWViewController ()

@end

@implementation TWPlistRWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self createPlistFile];
    [self readPlistFile];
    [self saveDefaultsPlist];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//创建plist文件 填充数据
- (void)createPlistFile
{
    NSDictionary *data = [[NSDictionary alloc]initWithObjectsAndKeys:@"name",@"key1",@"age",@"key2",@"class",@"key3", nil];
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath1 = [paths objectAtIndex:0];
    
    //得到完整的文件名
    NSString *filename=[plistPath1 stringByAppendingPathComponent:@"test.plist"];
    NSLog(@"得到完整的文件名=====%@=>",filename);
    //输入写入
    [data writeToFile:filename atomically:YES];
    
    //那怎么证明我的数据写入了呢？读出来看看
    NSMutableDictionary *data1 = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    NSLog(@"%@", data1);
}

- (void)readPlistFile
{
    // 一个NSBundle对象对应一个资源包（图片、音频、视频、plis等文件）
    // NSBundle的作用：用来访问与之对应的资源包内部的文件，可以用来获得文件的全路径
    // 项目中添加的资源都会被添加到主资源包中
    // [NSBundle mainBundle]关联的就是项目的主资源包
    NSBundle *bundle = [NSBundle mainBundle];
    
    // 利用mainBundle获得plist文件在主资源包中的全路径
    NSString *file = [bundle pathForResource:@"shops" ofType:@"plist"];
    //    NSString *file = [bundle pathForResource:@"shops.plist" ofType:nil];
    
    // 凡是参数名为File，传递的都是文件的全路径
    NSArray *array = [NSArray arrayWithContentsOfFile:file];
    NSLog(@"打印一下plist的数据===》%@",array);
}

- (void)saveDefaultsPlist
{
    NSString *userName = @"ceshi";
    int userid = 1234;
    //存储
    [[NSUserDefaults standardUserDefaults] setInteger:userid forKey:@"userId"];
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"userName"];
    
    //取出
   int userId = [[NSUserDefaults standardUserDefaults] integerForKey:@"userId"];
    NSString *username = [[NSUserDefaults standardUserDefaults] stringForKey:@"userName"];
    NSLog(@"userId == >%d  userName===>%@",userId,username);
    
    UILabel *dataLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, SCREEN_WIDTH - 40, 30)];
    dataLabel.font = [UIFont systemFontOfSize:11.0];
    dataLabel.text = [NSString stringWithFormat:@"userId == >%d, username==>%@",userId,username];
    
    //对象的存储一定要转换成Dictionary 这样能存储到NSUserdefaults
    TWUser *twuser = [[TWUser alloc]init];
    twuser.userID = 1456;
    twuser.name = @"tangwei";
    
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    [userdefaults setObject:[twuser encodedItem] forKey:@"twuser"];
    [userdefaults synchronize];
    //取出来的对象一定要转换成dictionary
    NSDictionary *twuserDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"twuser"];
    
    UILabel *userLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 180, SCREEN_WIDTH - 40, 30)];
    userLabel.font = [UIFont systemFontOfSize:11.0];
    
    TWUser *usertw = [[TWUser alloc]init];
    usertw.userID = [[twuserDic objectForKey:@"userID"] intValue];
    usertw.name = [twuserDic objectForKey:@"name"];
    
    userLabel.text = [NSString stringWithFormat:@"userId == >%d, username==>%@",usertw.userID,usertw.name];
    
    NSLog(@"userId == >%d  userName===>%@",usertw.userID,usertw.name);
    
    [self.view addSubview:dataLabel];
    [self.view addSubview:userLabel];
    TWLog(@"ceshi123============123===>");
}

- (void)saveNSStringtoFile
{
    TWUser *twuser = [[TWUser alloc]init];
    twuser.userID = 1456;
    twuser.name = @"tangwei";
    NSString *filedata = [NSString jsonStringWithObject:twuser];
    
    TWLog(@"==filedata的内容为===%@",filedata);
    
}
@end
