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
#import "LGPhoto.h"



@interface PHTabBarController ()<HWTabBarDelegate,LGPhotoPickerViewControllerDelegate,LGPhotoPickerBrowserViewControllerDataSource,LGPhotoPickerBrowserViewControllerDelegate>


@end

@implementation PHTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.初始化子控制器
    MNHomeViewController *home = [[MNHomeViewController alloc] init];
    [self addChildVc:home title:kTabBarTitle_Home image:kImageN_tabbar_home selectedImage:kImageN_tabbar_home_selected];
    
    MNDiscoverController *messageCenter = [[MNDiscoverController alloc] init];
    [self addChildVc:messageCenter title:kTabBarTitle_Discover image:kImageN_tabbar_message_center selectedImage:kImageN_tabbar_message_center_selected];
    
    MNMessageViewController *discover = [[MNMessageViewController alloc] init];
    [self addChildVc:discover title:kTabBarTitle_Message image:kImageN_tabbar_discover selectedImage:kImageN_tabbar_discover_selected];
    
    MNMeViewController *profile = [[MNMeViewController alloc] init];
    [self addChildVc:profile title:kTabBarTitle_Me image:kImageN_tabbar_profile selectedImage:kImageN_tabbar_profile_selected];
    
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
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor MNColor_pink];
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
    LGPhotoPickerViewController *pickerVc = [[LGPhotoPickerViewController alloc] initWithShowType:LGShowImageTypeImagePicker];
    pickerVc.status = PickerViewShowStatusCameraRoll;
    pickerVc.maxCount = 9;   // 最多能选9张图片
    pickerVc.delegate = self;
    pickerVc.topShowPhotoPicker = YES;
    [pickerVc showPickerVc:self];
}

@end




