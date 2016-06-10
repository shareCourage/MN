
//
//  MNAttentionCell.m
//  MNiang
//
//  Created by Kowloon on 16/6/10.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import "MNAttentionCell.h"

@interface MNAttentionCell ()


@end

@implementation MNAttentionCell

+ (instancetype)userBaseCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"MNAttentionCell";
    MNAttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MNAttentionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    [super baseCell_CommonInit];
    
    UILabel *detail = [UILabel new];
    detail.numberOfLines = 0;
    detail.font = [UIFont systemFontOfSize:14];
    detail.textColor = [UIColor MNColor_deepGray];
    [self.wordView addSubview:detail];
    _detailAttentionLabel = detail;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat detailX = 0;
    CGFloat detailY = CGRectGetMaxY(self.userNameL.frame);
    CGFloat detailW = CGRectGetWidth(self.wordView.frame);
    CGFloat detailH = CGRectGetHeight(self.wordView.frame) - CGRectGetHeight(self.userNameL.frame);
    self.detailAttentionLabel.frame = CGRectMake(detailX, detailY, detailW, detailH);
}

@end
