//
//  AppDelegate.m
//  MNiang
//
//  Created by Kowloon on 16/6/7.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import "AppDelegate.h"
#import "PHTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    PHTabBarController *tabBarVC = [[PHTabBarController alloc] init];
    MNLog(@"%s",__func__);
    
    MNLog(@"==============");
    MNLog(@"are you kiding me?");
    MNLog(@"==============");
    self.window.rootViewController = tabBarVC;
    
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)testMethod
{
    MNLog(@"testMethod");
}



@end
