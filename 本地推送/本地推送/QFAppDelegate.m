//
//  QFAppDelegate.m
//  本地推送
//
//  Created by Honey on 15/3/12.
//  Copyright (c) 2015年 Honey. All rights reserved.
//

#import "QFAppDelegate.h"

@implementation QFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //程序没有启动的情况
    if (launchOptions != nil)
    {
        NSLog(@"程序启动时候获取用户点击的推送信息");
        //获取用户点击的推送
        UILocalNotification *x = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
//        本地推送
//        UIApplicationLaunchOptionsLocalNotificationKey
//        远程推送
//        UIApplicationLaunchOptionsRemoteNotificationKey
        
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"程序启动时候获取用户点击的推送信息" message:[x alertBody] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        
        [a show];
    }
    
    
    
    //本地推送
    UILocalNotification *local = [[UILocalNotification alloc] init];
    //推送内容
    //textLabel
    local.alertBody = @"和p友去逛街";
    //detailTextLabel
    local.alertAction = @"哈哈哈哈哈哈哈哈";
    //设置当前推送数量
    local.applicationIconBadgeNumber = 10;
    
    //推送时间
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    local.fireDate = fireDate;
    
    //重复周期
    local.repeatInterval = NSCalendarUnitMinute;

    

    //设置推送声音
    //UILocalNotificationDefaultSoundName : 默认声音
    local.soundName = @"ring.caf";
    
    //发送推送,交给系统来进行发送,即使程序没有启动,系统也会将该信息推送给用户
    [[UIApplication sharedApplication] scheduleLocalNotification:local];
    
    //处理点击推送时候的事件
    //通过代理方法完成
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
}

//用户点击推送时候会触发的方法,前提是程序正在运行(不管是在前台还是后台)
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification /*用户点击的推送消息*/
{
    //判断当前应用程序的状态
    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateInactive)
    {
        //程序处于后台状态
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"test" message:[notification alertBody] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        
        [a show];
        
        NSLog(@"点击推送进入");
    }
    else
    {
        NSLog(@"程序正在运行");
    }
    NSLog(@"hello ±±±±±:%@", notification.alertBody);
    
    //取消远程推送
    //[[UIApplication sharedApplication] unregisterForRemoteNotifications];
    
    //删除指定推送
    [[UIApplication sharedApplication] cancelLocalNotification:notification];
    //删除所有推送
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
