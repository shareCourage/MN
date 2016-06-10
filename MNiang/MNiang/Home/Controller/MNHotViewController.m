//
//  MNHotViewController.m
//  MNiang
//
//  Created by Kowloon on 16/6/10.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import "MNHotViewController.h"
#import "PHCollectionViewLayout.h"
#import "MNImageViewCell.h"
#import "UIImageView+WebCache.h"
#import "MNHotCollectionReusableView.h"

@interface MNHotViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, PHCollectionViewLayoutDelegate>

@property (nonatomic, strong) NSMutableArray *phModels;

@property (nonatomic, weak) UICollectionView *phCollectionView;


@end

@implementation MNHotViewController

- (NSMutableArray *)phModels {
    if (!_phModels) {
        _phModels = [NSMutableArray array];
        [_phModels addObject:@"http://s13.mogujie.cn/b7/bao/131012/vud8_kqywordekfbgo2dwgfjeg5sckzsew_310x426.jpg_200x999.jpg"];
        [_phModels addObject:@"http://s6.mogujie.cn/b7/bao/131008/q2o17_kqyvcz3ckfbewv3wgfjeg5sckzsew_330x445.jpg_200x999.jpg"];
        [_phModels addObject:@"http://s6.mogujie.cn/b7/bao/131011/zovz9_kqyuwtdykfbgo2dwgfjeg5sckzsew_290x383.jpg_200x999.jpg"];
        // 刷新数据
        [self.phCollectionView reloadData];
    }
    return _phModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor MNColor_pink];
    [self collectionViewSetup];

}

static NSString *const cellIdentifier = @"cellIdentifier";
- (void)collectionViewSetup {
    PHCollectionViewLayout *layout = [[PHCollectionViewLayout alloc] init];
    layout.delegate = self;
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWindowWidth, 200) collectionViewLayout:layout];
    collectionV.backgroundColor = [UIColor whiteColor];
    collectionV.dataSource = self;
    collectionV.delegate = self;
    [collectionV registerNib:[UINib nibWithNibName:NSStringFromClass([MNHotCollectionReusableView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    [collectionV registerNib:[UINib nibWithNibName:NSStringFromClass([MNHotCollectionReusableView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];


    [collectionV registerNib:[UINib nibWithNibName:NSStringFromClass([MNImageViewCell class]) bundle:nil] forCellWithReuseIdentifier:cellIdentifier];

    [self.view addSubview:collectionV];
    self.phCollectionView = collectionV;
}

#pragma mark - UICollectionViewDataSource UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.phModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MNImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    NSString *url = [self.phModels objectAtIndex:indexPath.item];
    [cell.mnImageView sd_setImageWithURL:[NSURL URLWithString:url]];
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    MNHotCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    if (kind == UICollectionElementKindSectionHeader) {
        reusableView.tipLabe.text = @"最新";
    } else if (kind == UICollectionElementKindSectionFooter) {
        reusableView.tipLabe.text = @"最热";
    }
    
    return reusableView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MNLog(@"%s",__func__);
    
}

#pragma mark - PHCollectionViewLayoutDelegate
static CGFloat const padding = 10;
static NSInteger columMax = 3;
- (CGFloat)collectionViewLayout:(PHCollectionViewLayout *)collectionViewLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    CGFloat width = (kWindowWidth - (columMax + 1) * padding) / columMax;
    return width;
}

- (CGFloat)rowMarginInCollectionViewLayout:(PHCollectionViewLayout *)collectionViewLayout
{
    return padding;
}

- (CGFloat)columnCountInCollectionViewLayout:(PHCollectionViewLayout *)collectionViewLayout
{
    return columMax;
}

- (UIEdgeInsets)edgeInsetsInCollectionViewLayout:(PHCollectionViewLayout *)collectionViewLayout
{
    return UIEdgeInsetsMake(padding, padding, padding, padding);
}

@end
