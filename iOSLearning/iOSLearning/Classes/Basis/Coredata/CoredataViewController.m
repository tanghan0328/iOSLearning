//
//  CoredataViewController.m
//  iOSLearning
//
//  Created by tang on 16/4/5.
//  Copyright © 2016年 tang. All rights reserved.
//
#import <CoreData/CoreData.h>
#import "CoredataViewController.h"
#import "Student+CoreDataClass.h"
#import "Grade+CoreDataClass.h"

@interface CoredataViewController ()

@property (strong,nonatomic)NSManagedObjectContext *managedObjectContext;
@property (strong,nonatomic)NSManagedObjectModel *managedObjectModel;
@property (strong,nonatomic)NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation CoredataViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self initWithBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initWithBtn
{
    UIButton *btnAdd = [[UIButton alloc]initWithFrame:CGRectMake(120, 120, 160, 30)];
    [btnAdd setTitle:@"添加实体类" forState:UIControlStateNormal];
    btnAdd.backgroundColor = [UIColor greenColor];
    [btnAdd addTarget:self action:@selector(addStudent) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnRemove = [[UIButton alloc]initWithFrame:CGRectMake(120, 180, 160, 30)];
    [btnRemove setTitle:@"删除实体类" forState:UIControlStateNormal];
    btnRemove.backgroundColor = [UIColor greenColor];
    [btnRemove addTarget:self action:@selector(removeStudents) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnShow = [[UIButton alloc]initWithFrame:CGRectMake(120, 240, 160, 30)];
    [btnShow setTitle:@"查询实体类" forState:UIControlStateNormal];
    btnShow.backgroundColor = [UIColor greenColor];
    [btnShow addTarget:self action:@selector(getStudent) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btnAdd];
    [self.view addSubview:btnRemove];
    [self.view addSubview:btnShow];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext =self.managedObjectContext;
    if (managedObjectContext !=nil) {
        if ([self managedObjectContext] && ![[self managedObjectContext] save:&error]) {
            NSLog(@"Unresolvederror %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to thepersistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        self.managedObjectContext = [[NSManagedObjectContext alloc]init];
        [self.managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application'smodel.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel !=nil) {
        return _managedObjectModel;
    }
    //这里一定要注意，这里的iWeather就是你刚才建立的数据模型的名字，一定要一致。否则会报错。
    NSURL *modelURL = [[NSBundle mainBundle]URLForResource:@"Model"withExtension:@"momd"];
    self.managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and theapplication's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator !=nil) {
        return _persistentStoreCoordinator;
    }
    //这里的iWeaher.sqlite，也应该与数据模型的名字保持一致。
    NSURL *storeURL = [[self applicationDocumentsDirectory]URLByAppendingPathComponent:@"Model.sqlite"];
    
    NSError *error = nil;
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self managedObjectModel]];
    
    NSDictionary *optionsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES],
                                       NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES],
                                       NSInferMappingModelAutomaticallyOption, nil];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:optionsDictionary error:&error]) {
        NSLog(@"Unresolvederror %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL*)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}


- (void)addStudent
{
    Student *stu = [NSEntityDescription insertNewObjectForEntityForName:@"Student"
                                                     inManagedObjectContext:self.managedObjectContext];
    stu.id = @123;
    stu.sex = [NSNumber numberWithInteger:1];
    stu.brithday = [NSDate dateWithTimeIntervalSinceNow:0.0];
    stu.aum = [NSNumber numberWithFloat:1111.0f];
    stu.descstudent = @"测试";
    stu.stuname = @"张三";
    stu.ceshi = @"旺达";
    NSError *error;
    //保存上下文,这里需要注意，增、删、改操作完最后必须调用管理对象上下文的保存方法，否则操作不会执行。
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"添加过程中发生错误,错误信息：%@！",error.localizedDescription);
    }
    NSLog(@"添加成功");
}

- (void)removeStudents{
    // 1. 实例化查询请求
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    
    // 2. 设置谓词条件
    request.predicate = [NSPredicate predicateWithFormat:@"stuname = '张三'"];
    
    // 3. 由上下文查询数据
    NSArray *result = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    // 4. 输出结果
    for (Student *student in result) {
        NSLog(@"%@ %@ %@", student.stuname, student.sex, student.brithday);
        // 删除一条记录
        [self.managedObjectContext deleteObject:student];
        break;
    }
    
    // 5. 通知_context保存数据
    NSError *error;
    if ([self.managedObjectContext save:nil]) {
        NSLog(@"删除成功");
    } else {
         NSLog(@"删除过程中发生错误，错误信息：%@!",error.localizedDescription);
    }

}
    
- (NSArray *)getStudent{
    //创建查询请求
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    //设置查询条件
    request.predicate = [NSPredicate predicateWithFormat:@"stuname  = %@",@"张三"];
    //获取查询结果
    NSArray *users = [self.managedObjectContext executeFetchRequest:request error:nil];
//    //下面是用谓词对上面的结果进行过滤
//    NSPredicate *userPredicate = [NSPredicate predicateWithFormat:@"user.id =%@",@"1"];
//    //对查询结果再进行过滤
//    NSArray *users = [statuses filteredArrayUsingPredicate:userPredicate];
    for (int i = 0; i<users.count; i++) {
        Student *stu = users[i];
        NSLog(@"=Student==%@===%@==%@====%@===%@",stu.stuname,stu.id,stu.aum,stu.descstudent, stu.ceshi);
    }
    NSLog(@"====getStudent.count===%ld=",users.count);
    return users;
}

@end
