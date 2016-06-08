//
//  PHTabBarController.m
//  FamilyCare
//
//  Created by Kowloon on 15/2/27.
//  Copyright (c) 2015年 Goome. All rights reserved.
//

#import "PHTabBarController.h"
#import "HWTabBar.h"
#import "MNHomeViewController.h"
#import "MNDiscoverController.h"
#import "MNMeViewController.h"
#import "MNMessageViewController.h"
#import "PHNavigationController.h"

@interface PHTabBarController ()<HWTabBarDelegate>


@end

@implementation PHTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.初始化子控制器
    MNHomeViewController *home = [[MNHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    MNDiscoverController *messageCenter = [[MNDiscoverController alloc] init];
    [self addChildVc:messageCenter title:@"发现" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    MNMessageViewController *discover = [[MNMessageViewController alloc] init];
    [self addChildVc:discover title:@"消息" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    MNMeViewController *profile = [[MNMeViewController alloc] init];
    [self addChildVc:profile title:@"我的" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    // 2.更换系统自带的tabbar
    HWTabBar *tabBar = [[HWTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kRGBColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    PHNavigationController *nav = [[PHNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}

#pragma mark - HWTabBarDelegate代理方法
- (void)tabBarDidClickPlusButton:(HWTabBar *)tabBar
{
    MNLog(@"tabBarDidClickPlusButton");
}

@end




