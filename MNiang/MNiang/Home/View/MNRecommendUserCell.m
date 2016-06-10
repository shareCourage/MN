//
//  MNRecommendUserCell.m
//  MNiang
//
//  Created by Kowloon on 16/6/10.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import "MNRecommendUserCell.h"

@implementation MNRecommendUserCell

+ (instancetype)userBaseCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"MNRecommendUserCell";
    MNRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MNRecommendUserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    
    
}

@end
