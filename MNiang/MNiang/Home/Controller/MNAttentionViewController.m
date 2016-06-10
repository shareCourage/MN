//
//  MNAttentionViewController.m
//  MNiang
//
//  Created by Kowloon on 16/6/10.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import "MNAttentionViewController.h"
#import "MNAttentionCell.h"

@interface MNAttentionViewController () <MNUserBaseCellDelegate>

@end

@implementation MNAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"全部关注";
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kWindowWidth, 35)];
//    label.text = @"全部关注";
//    return label;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MNAttentionCell *cell = [MNAttentionCell userBaseCellWithTableView:tableView];
    cell.delegate = self;
    cell.avatarView.image = [UIImage imageNamed:kImageN_tabbar_home];
    cell.userNameL.text = @"cellForRowAtIndexPath";
    cell.detailAttentionLabel.text = @"cellForRowAtIndexPathcellForRowAtIndexPathcellForRowAtIndexPathcellForRowAtIndexPathcellForRowAtIndexPathcellForRowAtIndexPath";
    return cell;
}


#pragma mark - MNUserBaseCellDelegate
- (void)userBaseCellDidClickAvatarView:(MNUserBaseCell *)baseCell {
    MNLog(@"%s",__func__);
}

- (void)userBaseCellDidClickAddBtn:(MNUserBaseCell *)baseCell {
    MNLog(@"%s",__func__);
}

@end




