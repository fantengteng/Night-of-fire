//
//  AppDelegate.m
//  磁力云打印
//
//  Created by linlin dang on 2019/4/16.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "AppDelegate.h"
#import "RootC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
   
    RootC *rc = [[RootC alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:rc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
 
}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  
}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {
 
}


@end
