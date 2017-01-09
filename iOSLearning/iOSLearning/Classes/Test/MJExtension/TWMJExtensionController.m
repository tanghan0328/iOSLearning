//
//  TWMJExtensionController.m
//  iOSLearning
//
//  Created by tang on 17/1/5.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "TWMJExtensionController.h"
#import "MJExtension.h"
#import "User.h"
#import "Status.h"
#import "TWStudentB.h"

@interface TWMJExtensionController ()

@end

@implementation TWMJExtensionController

- (void)viewDidLoad {
    [super viewDidLoad];
    //第一种dict
    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale),
                           @"gay" : @"true"
                           //   @"gay" : @"1"
                           //   @"gay" : @"NO"
                           };
    
    User *user = [User mj_objectWithKeyValues:dict];
    NSLog(@"name=%@, icon=%@, age=%zd, height=%@, money=%@, sex=%d, gay=%d", user.name, user.icon, user.age, user.height, user.money, user.sex, user.gay);
    
    //第二种 string
    NSString *jsonString = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";
    User *usera = [User mj_objectWithKeyValues:jsonString];
    NSLog(@"name=%@, icon=%@, age=%d", usera.name, usera.icon, usera.age);

    //第三种 模型中的嵌套模型
    NSDictionary *dicta = @{
                           @"text" : @"Agree!Nice weather!",
                           @"user" : @{
                                   @"name" : @"Jack",
                                   @"icon" : @"lufy.png"
                                   },
                           @"retweetedStatus" : @{
                                   @"text" : @"Nice weather!",
                                   @"user" : @{
                                           @"name" : @"Rose",
                                           @"icon" : @"nami.png"
                                           }
                                   }
                           };
    
    Status *status = [Status mj_objectWithKeyValues:dicta];
    
    NSString *text = status.text;
    NSString *name = status.user.name;
    NSString *icon = status.user.icon;
    NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    // text=Agree!Nice weather!, name=Jack, icon=lufy.png
    
    NSString *text2 = status.retweetedStatus.text;
    NSString *name2 = status.retweetedStatus.user.name;
    NSString *icon2 = status.retweetedStatus.user.icon;
    NSLog(@"text2=%@, name2=%@, icon2=%@", text2, name2, icon2);
    
    //第四种 模型中有个数组属性 数组里面还有其他的模型
    NSDictionary *dictb = @{
                           @"statuses" : @[
                                   @{
                                       @"text" : @"Nice weather!",
                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       },
                                   @{
                                       @"text" : @"Go camping tomorrow!",
                                       @"user" : @{
                                               @"name" : @"Jack",
                                               @"icon" : @"lufy.png"
                                               }
                                       }
                                   ],
                           @"ads" : @[
                                   @{
                                       @"image" : @"ad01.png",
                                       @"url" : @"http://www.ad01.com"
                                       },
                                   @{
                                       @"image" : @"ad02.png",
                                       @"url" : @"http://www.ad02.com"
                                       }
                                   ],
                           @"totalNumber" : @"2014"
                           };

    
    [StatusResult mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"statuses": @"Status",
                 @"ads": @"Ad"
                 };
    }];
    
    StatusResult *result = [StatusResult mj_objectWithKeyValues:dictb];
    NSLog(@"totalNumber=%@", result.totalNumber);

    for (Status *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    }
    for (Ad *ad in result.ads) {
        NSLog(@"image=%@, url=%@", ad.image, ad.url);
    }

    //第五种 模型中的属性名和字典中的key不相同（或者需要多级映射）
    NSDictionary *dictc = @{
                           @"id" : @"20",
                           @"desciption" : @"kids",
                           @"name" : @{
                                   @"newName" : @"lufy",
                                   @"oldName" : @"kitty",
                                   @"info" : @[
                                           @"test-data",
                                           @{
                                               @"nameChangedTime" : @"2013-08"
                                               }
                                           ]
                                   },
                           @"other" : @{
                                   @"bag" : @{
                                           @"name" : @"a red bag",
                                           @"price" : @100.7
                                           }
                                   }
                           };
    
    [TWStudentB mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID": @"id",
                 @"desc": @"desciption",
                 @"oldName": @"name.oldName",
                 @"nowName": @"name.newName",
                 @"nameChangedTime": @"name.info[1]",
                 @"bag": @"other.bag"
                 };
    }];
    
    TWStudentB *stu = [TWStudentB mj_objectWithKeyValues:dictc];
    // Printing
    NSLog(@"ID=%@, desc=%@, oldName=%@, nowName=%@, nameChangedTime=%@",
          stu.ID, stu.desc, stu.oldName, stu.nowName, stu.nameChangedTime);
    // ID=20, desc=kids, oldName=kitty, nowName=lufy, nameChangedTime=2013-08
    NSLog(@"bagName=%@, bagPrice=%f", stu.bag.name, stu.bag.price);
    // bagName=a red bag, bagPrice=100.700000
    
    //第六种 将一个字典转换成模型数组
    NSArray *dictArray = @[
                           @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png"
                               },
                           @{
                               @"name" : @"Rose",
                               @"icon" : @"nami.png"
                               }
                           ];
    NSArray *userArray = [User mj_objectArrayWithKeyValuesArray:dictArray];
    for(User *user in userArray){
        NSLog(@"name = %@, icon =%@", user.name,user.icon);
    }
    
    //第七种 将一个模型转成字典
    User *userb = [[User alloc]init];
    userb.name = @"caocao";
    userb.icon = @"ceshi";
    
    Status *statusb = [[Status alloc]init];
    statusb.user = userb;
    statusb.text = @"我就想看看";
    
    NSDictionary *statusDic = statusb.mj_keyValues;
    NSLog(@"statusDic===%@", statusDic);

    TWStudentB *studentb = [[TWStudentB alloc]init];
    studentb.ID = @"123";
    studentb.oldName = @"rose";
    studentb.nowName = @"jack";
    studentb.desc = @"handsome";
    studentb.nameChangedTime = @"2018-09-08";
    
    Bag *bag = [[Bag alloc] init];
    bag.name = @"a red bag";
    bag.price = 205;
    stu.bag = bag;
    
    NSDictionary *stuDic = studentb.mj_keyValues;
    NSLog(@"stuDic====%@", stuDic);
    
    //第八种 将一个模型数组转成字典数组
    User *user1 = [[User alloc] init];
    user1.name = @"Jack";
    user1.icon = @"lufy.png";
    
    User *user2 = [[User alloc] init];
    user2.name = @"Rose";
    user2.icon = @"nami.png";
    
    NSArray *userArrayb = @[user1,user2];
    NSArray *dicArray = [User mj_keyValuesArrayWithObjectArray:userArrayb];
    NSLog(@"dicArray====%@", dictArray);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)testUIView
{
    self.view.backgroundColor = [UIColor redColor];
}
@end
