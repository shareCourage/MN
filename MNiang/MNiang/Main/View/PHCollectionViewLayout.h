//
//  PHCollectionViewLayout.h
//  WaterFlow
//
//  Created by Kowloon on 16/2/24.
//  Copyright © 2016年 PaulCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PHCollectionViewLayout;

@protocol PHCollectionViewLayoutDelegate <NSObject>
@required
- (CGFloat)collectionViewLayout:(PHCollectionViewLayout *)collectionViewLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInCollectionViewLayout:(PHCollectionViewLayout *)collectionViewLayout;
- (CGFloat)columnMarginInCollectionViewLayout:(PHCollectionViewLayout *)collectionViewLayout;
- (CGFloat)rowMarginInCollectionViewLayout:(PHCollectionViewLayout *)collectionViewLayout;
- (UIEdgeInsets)edgeInsetsInCollectionViewLayout:(PHCollectionViewLayout *)collectionViewLayout;
@end

@interface PHCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, weak) id <PHCollectionViewLayoutDelegate> delegate;

@end
