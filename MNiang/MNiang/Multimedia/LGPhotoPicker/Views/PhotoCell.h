//
//  PhotoCell.h
//  LGPhotoBrowser
//
//  Created by 徐遵成 on 16/6/10.
//  Copyright © 2016年 L&G. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UICollectionViewCell

+ (instancetype) cellWithCollectionView : (UICollectionView *) collectionView cellForItemAtIndexPath:(NSIndexPath *) indexPath;

@property (nonatomic , strong) UIImage *cellImage;

@end
