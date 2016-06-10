//
//  MNImageViewCell.m
//  MNiang
//
//  Created by Kowloon on 16/6/10.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import "MNImageViewCell.h"

@implementation MNImageViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.mnImageView.layer.cornerRadius = 5;
    self.mnImageView.layer.masksToBounds = YES;
}

@end
