//
//  MNHomeViewController.m
//  MNiang
//
//  Created by Kowloon on 16/6/7.
//  Copyright © 2016年 PHH. All rights reserved.
//

#import "MNHomeViewController.h"
#import "MNHotViewController.h"
#import "MNAttentionViewController.h"

@interface MNHomeViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) MNHotViewController *hotVC;
@property (nonatomic, strong) MNAttentionViewController *attentionVC;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UISegmentedControl *segmentControl;

@end

@implementation MNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self segmentInitial];
    [self addChildController];
}


- (void)segmentInitial {
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"热门", @"关注"]];
    seg.selectedSegmentIndex = 0;
    
    UIFont *font = [UIFont systemFontOfSize:20];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                           forKey:NSFontAttributeName];
    [seg setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *colorAttr = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    [seg setTitleTextAttributes:colorAttr forState:UIControlStateNormal];

    seg.tintColor = [UIColor MNColor_pink];
    seg.frame = CGRectMake(0, 0, kWindowWidth - 30, 35);
    [seg addTarget:self action:@selector(segTarget:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = seg;
    self.segmentControl = seg;
}

- (void)segTarget:(UISegmentedControl *)segmentControl {
    NSInteger value = segmentControl.selectedSegmentIndex;
    [self.scrollView setContentOffset:CGPointMake(kWindowWidth * value, 0) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger value = scrollView.contentOffset.x / kWindowWidth;
    self.segmentControl.selectedSegmentIndex = value;
}

- (void)addChildController {
    self.hotVC = [MNHotViewController new];
    [self addChildViewController:self.hotVC];
    
    self.attentionVC = [MNAttentionViewController new];
    [self addChildViewController:self.attentionVC];

    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kWindowWidth, kWindowHeight - 64 - 49)];
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(kWindowWidth * 2, CGRectGetHeight(scrollView.frame));
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    
    [self.hotVC.view setFrame:CGRectMake(0, 0, kWindowWidth, CGRectGetHeight(scrollView.frame))];
    [self.attentionVC.view setFrame:CGRectMake(kWindowWidth, 0, kWindowWidth, CGRectGetHeight(scrollView.frame))];
    [scrollView addSubview:self.hotVC.view];
    [scrollView addSubview:self.attentionVC.view];
}

@end
