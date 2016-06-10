//
//  MNObject.m
//  MNiang
//
//  Created by Kowloon on 16/6/7.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import "MNObject.h"


NSString *kImageN_tabbar_home                       = @"tabbar_home";
NSString *kImageN_tabbar_home_selected              = @"tabbar_home_selected";
NSString *kImageN_tabbar_message_center             = @"tabbar_message_center";
NSString *kImageN_tabbar_message_center_selected    = @"tabbar_message_center_selected";
NSString *kImageN_tabbar_discover                   = @"tabbar_discover";
NSString *kImageN_tabbar_discover_selected          = @"tabbar_discover_selected";
NSString *kImageN_tabbar_profile                    = @"tabbar_profile";
NSString *kImageN_tabbar_profile_selected           = @"tabbar_profile_selected";

NSString *kTabBarTitle_Home                         = @"首页";
NSString *kTabBarTitle_Discover                     = @"发现";
NSString *kTabBarTitle_Message                      = @"消息";
NSString *kTabBarTitle_Me                           = @"我";


@implementation MNObject

@end


@implementation UIColor (MNPattern)

+ (UIColor *)MNColor_pink {
    return MNRGBColor(236, 188, 189);
}


/**
 *  蓝色,酷米客主题颜色
 *  用于特别需要强调和突出的文字、按钮和icon(16,171,254)
 */
+ (UIColor *)MNColor_blue {
    return MNRGBColor(16, 171, 254);
}

+ (UIColor *)MNColor_lightBlue{
    return MNRGBColor(24, 54, 113);
}

/**
 *  深黑色
 *  用于重要级别文字信息，标题信息(51,51,51) & #333333
 */
+ (UIColor *)MNColor_deepBlack {
    return MNRGBColor(51,51,51);
}

/**
 *  深灰色
 *  用于普通级别文字信息(102,102,102)
 */
+ (UIColor *)MNColor_deepGray {
    return MNRGBColor(102,102,102);
}

/**
 *  普通灰色
 *  用于辅助、次要的文字信息、普通按钮描边(153,153,153) & #999999
 */
+ (UIColor *)MNColor_normalGray {
    return MNRGBColor(153,153,153);
}

/**
 *  分割线颜色
 *  用于分割线、标签描边(215,215,215)
 */
+ (UIColor *)MNColor_lightGray {
    return MNRGBColor(215,215,215);
}

/**
 *  浅淡灰色
 *  用于标签栏区域底色(246, 245,249)
 */
+ (UIColor *)MNColor_lighterGray {
    return MNRGBColor(246, 245,249);
}

/**
 *   背景颜色
 *  用于背景颜色(240,239,245)
 *
 */
+ (UIColor *)MNColor_lightBackgroundColor {
    return MNRGBColor(240,239,245);
}

/**
 *  背景颜色
 *  用于分割块的底色(250,250,251)
 *
 */
+ (UIColor *)MNColor_lighterBackgroundColor {
    return MNRGBColor(250,250,251);
}

+ (UIColor *)randomColor {
#if 1
    return MNRGBColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255));
#else
    return [UIColor clearColor];
#endif
}

+ (UIColor *)MNColor_placeholderRandomColor {
    NSUInteger value = arc4random_uniform(19);
    //    ASLog(@"randomcolor -> %@", @(value));
    switch (value) {
        case 1:
            return MNRGBColor(99, 130, 114);
            break;
        case 2:
            return MNRGBColor(132, 141, 127);
            break;
        case 3:
            return MNRGBColor(137, 155, 136);
            break;
        case 4:
            return MNRGBColor(169, 182, 172);
            break;
        case 5:
            return MNRGBColor(157, 206, 165);
            break;
        case 6:
            return MNRGBColor(228, 225, 218);
            break;
        case 7:
            return MNRGBColor(223, 224, 226);
            break;
        case 8:
            return MNRGBColor(234, 228, 229);
            break;
        case 9:
            return MNRGBColor(135, 134, 144);
            break;
        case 10:
            return MNRGBColor(130, 118, 127);
            break;
        case 11:
            return MNRGBColor(189, 151, 175);
            break;
        case 12:
            return MNRGBColor(212, 179, 198);
            break;
        case 13:
            return MNRGBColor(210, 186, 220);
            break;
        case 14:
            return MNRGBColor(252, 232, 250);
            break;
        case 15:
            return MNRGBColor(230, 221, 229);
            break;
        case 16:
            return MNRGBColor(153, 161, 182);
            break;
        case 17:
            return MNRGBColor(148, 164, 209);
            break;
        case 18:
            return MNRGBColor(192, 205, 229);
            break;
        case 19:
            return MNRGBColor(222, 229, 242);
            break;
        default:
            break;
    }
    return [UIColor randomColor];
}

@end

@implementation NSObject (MNPattern)
+ (CGFloat)MNHeight_cellOfHome {
    return 75.f;
}

+ (CGFloat)MNHeight_headerOfHome {
    return 30.f;
}

+ (CGFloat)MNHeight_cellOfProfile {
    return 46.f;
}

+ (CGFloat)MNHeight_separate {
    return 0.3f;
}

- (CGFloat)MNHeight_separate {
    return 0.3f;
}

- (CGFloat)MNHeight_cellOfHome {
    return 75.f;
}

- (CGFloat)MNHeight_headerOfHome {
    return 30.f;
}

- (CGFloat)MNHeight_cellOfProfile {
    return 46.f;
}


@end

@implementation NSObject (MNSeperateHeight)

+ (CGFloat)MNHeight_Seperate {
    return [self MNScaleHeight_SeperateWithOriginalHeight:1.f];
}

+ (CGFloat)MNScaleHeight_SeperateWithOriginalHeight:(CGFloat)height {
    CGFloat scale = [UIScreen mainScreen].scale;
    if (height <= 0) return 0;
    return height / scale;
}

@end


@implementation UIView (MNFont)

+ (UIFont *)MNSystemFont_MainCellPlate {
    return MNSystemFont(11);
}

+ (UIFont *)MNSystemFont_MainCellContent {
    return MNSystemFont(14);
}

+ (UIFont *)MNSystemFont_MainCellUserName {
    return MNSystemFont(12);
}

+ (UIFont *)MNSystemFont_MainCellPraiseAndComment {
    return MNSystemFont(13);
}
+ (UIFont *)MNSystemFont_MainCellPraiseAndComment2 {
    return MNSystemFont(14);
}

@end