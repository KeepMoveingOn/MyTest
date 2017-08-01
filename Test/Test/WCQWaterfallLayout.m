//
//  WCQWaterfallLayout.m
//  Test
//
//  Created by wcq on 2017/7/30.
//  Copyright © 2017年 Aspire. All rights reserved.
//

#import "WCQWaterfallLayout.h"

@implementation WCQWaterfallLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.contentHeight = 0;
    
    [self.columnHeight removeAllObjects];
    for (NSInteger index = 0; index < self.columnCount; index++) {
        
        [self.columnHeight addObject:@(self.edgeInsets.top)];
    }
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger index = 0; index < count; index++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
    self.columnWidth = self.edgeInsets.left;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat collectionW = self.collectionView.frame.size.width;
//    CGFloat w = (collectionW - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount - 1) * self.columnMargin) / self.columnCount;
    CGFloat w = [self.delegate waterfall:self widthForRowAtIndexPath:indexPath];
    CGFloat h = [self.delegate waterfall:self heightForRowAtIndexPath:indexPath];
    
    CGFloat x = 0;
    if (self.columnWidth + w + self.edgeInsets.right < self.coll) {
        
    }
    
//    NSInteger destColumn = 0;
//    CGFloat minColumnHeight = [self.columnHeight[0] floatValue];
//
//    for (NSInteger index = 0; index < self.columnCount; index++) {
//        
//        CGFloat columnHeight = [self.columnHeight[index] floatValue];
//        if (columnHeight < minColumnHeight) {
//            minColumnHeight = columnHeight;
//            destColumn = index;
//        }
//    }
//    
//    CGFloat x = self.edgeInsets.left + destColumn * (self.columnMargin + w);
//    CGFloat y = minColumnHeight;
//    if (y != self.edgeInsets.top) {
//        
//        y += self.rowMargin;
//    }
//    
//    CGRect frame = CGRectMake(x, y, w, h);
//    attrs.frame = frame;
//    
//    self.columnHeight[destColumn] = @(CGRectGetMaxY(frame));
//    CGFloat columnHeight = [self.columnHeight[destColumn] floatValue];
//    if (self.contentHeight < columnHeight) {
//        
//        self.contentHeight = columnHeight;
//    }
    
    return attrs;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.attrsArray;
}

- (CGSize)collectionViewContentSize {
    
    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
}

- (NSMutableArray *)attrsArray {
    
    if (!_attrsArray) {
        
        _attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}

- (NSMutableArray *)columnHeight {
    
    if (!_columnHeight) {
        
        _columnHeight = [[NSMutableArray alloc] init];
    }
    return _columnHeight;
}
@end
