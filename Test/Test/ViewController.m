//
//  ViewController.m
//  Test
//
//  Created by wcq on 2017/5/6.
//  Copyright © 2017年 Aspire. All rights reserved.
//

#import "ViewController.h"
#import "WCQCollectionReusableView.h"
#import "WCQWaterfallLayout.h"

#define a 234

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, WCQWaterfallLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) WCQWaterfallLayout *layout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WCQWaterfallLayoutDelegate
- (CGFloat)waterfall:(WCQWaterfallLayout *)layout heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (CGFloat)waterfall:(WCQWaterfallLayout *)layout widthForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return arc4random()%101;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0
                                           green:arc4random()%256/255.0
                                            blue:arc4random()%256/255.0
                                           alpha:1];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

//#pragma mark - UICollectionViewDelegateFlowLayout
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    
//    return 1;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    
//    return 1;
//}
//
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(100, 100);
}
//
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}

#pragma mark - Getter
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];


    }
    return _collectionView;
}

- (WCQWaterfallLayout *)layout {
    
    if (!_layout) {
        
        _layout = [[WCQWaterfallLayout alloc] init];
        _layout.edgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        _layout.columnCount = 3;
        _layout.columnMargin = 10;
        _layout.rowMargin = 10;
        _layout.delegate = self;
    }
    return _layout;
}


@end
