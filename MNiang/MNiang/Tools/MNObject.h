//
//  MNObject.h
//  MNiang
//
//  Created by Kowloon on 16/6/7.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PHKeyValueObserver.h"
#import "UIGestureRecognizer+YYAdd.h"
#import "UIControl+YYAdd.h"
#import "NSArray+MySeperateString.h"
#import "NSDictionary+PHCategory.h"
#import "UIButton+PHCategory.h"
#import "UIButton+EBButton.h"
#import "UILabel+PHCategory.h"
#import "NSDate+PHCategory.h"
#import "UIProgressView+PHCategory.h"
#import "UISlider+PHCategory.h"
#import "NSNumber+PHCategory.h"
#import "UIImage+PHCategory.h"
#import "UITextField+PHCategory.h"
#import "NSString+PHCategory.h"
#import "MBProgressHUD+MJ.h"
#import "UIViewController+PHCategory.h"
#import "UIView+PHLayout.h"
#import "MBProgressHUD+MJ.h"
#import "UIColor+PHCategory.h"
#import "UIAlertView+Blocks.h"

UIKIT_EXTERN NSString *kImageN_tabbar_home;
UIKIT_EXTERN NSString *kImageN_tabbar_home_selected;
UIKIT_EXTERN NSString *kImageN_tabbar_message_center;
UIKIT_EXTERN NSString *kImageN_tabbar_message_center_selected;
UIKIT_EXTERN NSString *kImageN_tabbar_discover;
UIKIT_EXTERN NSString *kImageN_tabbar_discover_selected;
UIKIT_EXTERN NSString *kImageN_tabbar_profile;
UIKIT_EXTERN NSString *kImageN_tabbar_profile_selected;

UIKIT_EXTERN NSString *kTabBarTitle_Home;
UIKIT_EXTERN NSString *kTabBarTitle_Discover;
UIKIT_EXTERN NSString *kTabBarTitle_Message;
UIKIT_EXTERN NSString *kTabBarTitle_Me;


@interface MNObject : NSObject

@end




#define MNRGBColor(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define MNRGBAColor(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define MNUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define MNSystemFont(value) ([UIFont systemFontOfSize:value])


@interface UIColor (GMPattern)

+ (UIColor *)MNColor_pink;

/**
 *  用于特别需要强调和突出的文字、按钮和icon(16,171,254) & #10abfe
 */
+ (UIColor *)MNColor_blue;

/**
 *  淡蓝色
 *  用于特殊地方的文字、按钮和icon(24,54,113)
 */
+ (UIColor *)MNColor_lightBlue;

/**
 *  深黑色
 *  用于重要级别文字信息，标题信息(51,51,51) & #333333
 */
+ (UIColor *)MNColor_deepBlack;

/**
 *  深灰色
 *  用于普通级别文字信息(102,102,102) & #666666
 */
+ (UIColor *)MNColor_deepGray;

/**
 *  普通灰色
 *  用于辅助、次要的文字信息、普通按钮描边(153,153,153) & #999999
 */
+ (UIColor *)MNColor_normalGray;

/**
 *  分割线颜色
 *  用于分割线、标签描边(215,215,215)  & #d7d7d7
 */
+ (UIColor *)MNColor_lightGray;

/**
 *  浅淡灰色
 *  用于标签栏区域底色(246, 245,249) & #f6f5f9
 */
+ (UIColor *)MNColor_lighterGray;

/**
 *   背景颜色
 *  用于背景颜色(240,239,245) & #f0eff5
 *
 */
+ (UIColor *)MNColor_lightBackgroundColor;

/**
 *  背景颜色
 *  用于分割块的底色(250,250,251)
 *
 */
+ (UIColor *)MNColor_lighterBackgroundColor;

/**
 *  随机颜色
 *
 */
+ (UIColor *)randomColor;

+ (UIColor *)MNColor_placeholderRandomColor;

@end

@interface NSObject (MNPattern)

/**
 *  cell高度
 *  酷米客公交搜索页面,75
 */
+ (CGFloat)MNHeight_cellOfHome;

/**
 *  UITableView中headerView高度
 *
 *  酷米客公交搜索页面,30
 */
+ (CGFloat)MNHeight_headerOfHome;

/**
 *  cell高度
 *  酷米客公交我的页面,44
 */
+ (CGFloat)MNHeight_cellOfProfile;

/**
 *  cell高度
 *  酷米客公交搜索页面,75
 */
- (CGFloat)MNHeight_cellOfHome;

/**
 *  UITableView中headerView高度
 *
 *  酷米客公交搜索页面,30
 */
- (CGFloat)MNHeight_headerOfHome;

/**
 *  cell高度
 *  酷米客公交我的页面,46，当头像高度为30的时候
 */
- (CGFloat)MNHeight_cellOfProfile;

/**
 *  分割线高度0.3
 *
 */
+ (CGFloat)MNHeight_separate;

/**
 *  分割线高度0.3
 *
 */
- (CGFloat)MNHeight_separate;

@end


@interface NSObject (MNSeperateHeight)

/**
 *  分割线高度，原始高度1.f,除于屏幕scale
 *
 */
+ (CGFloat)MNHeight_Seperate;

/**
 *  屏幕scale转换height后的高度
 *
 */
+ (CGFloat)MNScaleHeight_SeperateWithOriginalHeight:(CGFloat)height;

@end


@interface UIView (MNFont)

/**
 *  热门页面，cell内部的板块字体大小, 11
 *
 */
+ (UIFont *)MNSystemFont_MainCellPlate;

/**
 *  热门页面，主要内容的文字大小, 14
 *
 */
+ (UIFont *)MNSystemFont_MainCellContent;

/**
 *  热门页面，用户名称的文字大小, 12
 *
 */
+ (UIFont *)MNSystemFont_MainCellUserName;


/**
 *  热门页面，用户点赞和评论数字大小, 13
 *
 */
+ (UIFont *)MNSystemFont_MainCellPraiseAndComment;

/**
 *  其它页面，用户点赞和评论数字大小, 14
 *
 */
+ (UIFont *)MNSystemFont_MainCellPraiseAndComment2;

@end





