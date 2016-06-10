//
//  PhotoCell.m
//  LGPhotoBrowser
//
//  Created by 徐遵成 on 16/6/10.
//  Copyright © 2016年 L&G. All rights reserved.
//

#import "PhotoCell.h"
static NSString *const _cellIdentifier = @"firstCell";

@interface PhotoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end


@implementation PhotoCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifier forIndexPath:indexPath];
    
    return cell;
}


- (void)setCellImage:(UIImage *)cellImage
{
    _cellImage = cellImage;
    _imageView.image = cellImage;
}




@end
