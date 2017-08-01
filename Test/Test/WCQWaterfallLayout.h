//
//  WCQWaterfallLayout.h
//  Test
//
//  Created by wcq on 2017/7/30.
//  Copyright © 2017年 Aspire. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WCQWaterfallLayout;

@protocol WCQWaterfallLayoutDelegate <NSObject>

- (CGFloat)waterfall:(WCQWaterfallLayout *)layout heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)waterfall:(WCQWaterfallLayout *)layout widthForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WCQWaterfallLayout : UICollectionViewLayout

@property (nonatomic, strong) NSMutableArray *attrsArray;
@property (nonatomic, strong) NSMutableArray *columnHeight;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat columnMargin;
@property (nonatomic, assign) CGFloat rowMargin;
@property (nonatomic, assign) CGFloat columnCount;
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
@property (nonatomic, assign) CGFloat columnWidth;
@property (nonatomic, weak) id<WCQWaterfallLayoutDelegate> delegate;

@end
