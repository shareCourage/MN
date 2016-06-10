//
//  MNUserBaseCell.h
//  MNiang
//
//  Created by Kowloon on 16/6/10.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MNUserBaseCell;

@protocol MNUserBaseCellDelegate <NSObject>

@optional
- (void)userBaseCellDidClickAvatarView:(MNUserBaseCell *)baseCell;
- (void)userBaseCellDidClickAddBtn:(MNUserBaseCell *)baseCell;


@end


@interface MNUserBaseCell : UITableViewCell

@property (nonatomic, weak, readonly) UIImageView *avatarView;
@property (nonatomic, weak, readonly) UIButton *addBtn;
@property (nonatomic, weak, readonly) UIView *wordView;
@property (nonatomic, weak, readonly) UILabel *userNameL;

- (void)baseCell_CommonInit;

+ (instancetype)userBaseCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) id userModel;

@property (nonatomic, weak) id<MNUserBaseCellDelegate> delegate;

@end
