//
//  MNUserBaseCell.m
//  MNiang
//
//  Created by Kowloon on 16/6/10.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import "MNUserBaseCell.h"

@interface MNUserBaseCell ()

@end

@implementation MNUserBaseCell

+ (instancetype)userBaseCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"MNUserBaseCell";
    MNUserBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MNUserBaseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self baseCell_CommonInit];
    }
    return self;
}


- (void)baseCell_CommonInit {
    UIImageView *avatarV = [[UIImageView alloc] init];
//    avatarV.backgroundColor = [UIColor randomColor];
    avatarV.userInteractionEnabled = YES;
    kWS(ws);
    [avatarV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id sender) {
        if ([ws.delegate respondsToSelector:@selector(userBaseCellDidClickAvatarView:)]) {
            [ws.delegate userBaseCellDidClickAvatarView:ws];
        }
    }]];
    avatarV.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:avatarV];
    _avatarView = avatarV;
    
    UIView *wordV = [UIView new];
//    wordV.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:wordV];
    _wordView = wordV;
    
    UILabel *userNL = [[UILabel alloc] init];
//    userNL.backgroundColor = [UIColor redColor];
    userNL.font = [UIFont systemFontOfSize:17];
    userNL.textColor = [UIColor MNColor_deepBlack];
    [wordV addSubview:userNL];
    _userNameL = userNL;
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    addBtn.backgroundColor = [UIColor blueColor];
    [addBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
        if ([ws.delegate respondsToSelector:@selector(userBaseCellDidClickAddBtn:)]) {
            [ws.delegate userBaseCellDidClickAddBtn:ws];
        }
    }];
    [addBtn setImage:[UIImage imageNamed:kImageN_tabbar_home] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:kImageN_tabbar_home_selected] forState:UIControlStateSelected];
    [self.contentView addSubview:addBtn];
    _addBtn = addBtn;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat cellH = self.frame.size.height;
    CGFloat cellW = self.frame.size.width;
    CGFloat padding = 10;
    
    CGFloat avatarX = 15;
    CGFloat avatarY = padding;
    CGFloat avatarH = cellH - 2 * avatarY;
    CGFloat avatarW = avatarH;
    CGRect avatarFrame = CGRectMake(avatarX, avatarY, avatarW, avatarH);
    self.avatarView.frame = avatarFrame;
    self.avatarView.layer.cornerRadius = avatarW / 2;
    self.avatarView.layer.masksToBounds = YES;
    
    CGFloat addW = 30;
    CGFloat addH = addW;
    CGFloat addX = cellW - addW - padding;
    CGFloat addY = (cellH - addH) / 2;
    CGRect addFrame = CGRectMake(addX, addY, addW, addH);
    self.addBtn.frame = addFrame;
    
    CGFloat wordX = CGRectGetMaxX(self.avatarView.frame) + 12;
    CGFloat wordY = padding / 2;
    CGFloat wordW = cellW - wordX - (addW + 2 * padding);
    CGFloat wordH = cellH - 2 * wordY;
    CGRect wordVFrame =  CGRectMake(wordX, wordY, wordW, wordH);
    self.wordView.frame = wordVFrame;
    
    CGFloat userLX = 0;
    CGFloat userLY = 0;
    CGFloat userLW = CGRectGetWidth(wordVFrame);
    CGFloat userLH = 30;
    CGRect userLFrame = CGRectMake(userLX, userLY, userLW, userLH);
    self.userNameL.frame = userLFrame;
}


@end



