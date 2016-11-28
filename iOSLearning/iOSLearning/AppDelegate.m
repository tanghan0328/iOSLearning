//
//  AppDelegate.m
//  iOSLearning
//
//  Created by tang on 16/3/14.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "AppDelegate.h"
#import "TableListViewController.h"
#import "TabRootViewController.h"
#import "JPEngine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //TableListViewController *rootController = [[TableListViewController alloc]init];
    TabRootViewController *rootController = [[TabRootViewController alloc]init];
    //UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:rootController];
    //self.window.backgroundColor = [UIColor redColor];
    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];

    NSLog(@"app started.");
    NSLog(@"%@",NSStringFromCGSize([UIScreen mainScreen].bounds.size));
    
    //测试JSPath
    [JPEngine startEngine];
    NSString* path = [[NSBundle mainBundle]pathForResource:@"JSPathTest" ofType:@"js"];
    NSString* js = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:js];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
