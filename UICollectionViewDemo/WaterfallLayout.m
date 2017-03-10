//
//  WaterfallLayout.m
//  UICollectionViewDemo
//
//  Created by ptmind on 09/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "WaterfallLayout.h"

@interface WaterfallLayout ()

@property (nonatomic, strong) NSMutableArray *attrisArray;
@property (nonatomic, strong) NSMutableArray *lastRowAttris;
@property (nonatomic, assign) NSUInteger columnCount;
@property (nonatomic, assign) CGFloat columnMargin;
@property (nonatomic, assign) CGFloat rowMargin;
@property (nonatomic, assign) CGFloat contentHeight;

@end

@implementation WaterfallLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.attrisArray    = [NSMutableArray new];
        self.lastRowAttris  = [NSMutableArray new];
        self.columnCount    = 4;
        self.columnMargin   = 10.f;
        self.rowMargin      = 10.f;
        self.contentHeight = 0.f;
    }
    
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    //
    [self.lastRowAttris removeAllObjects];
    [self.attrisArray removeAllObjects];
    
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i=0; i< count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attris = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrisArray addObject:attris];
    }
}

- (UIEdgeInsets)edgeInsets {
    if ([self.delegate respondsToSelector:@selector(waterfallLayoutEdgeInsets)]) {
        return [self.delegate waterfallLayoutEdgeInsets];
    }
    
    return UIEdgeInsetsMake(12.5, 10, 10, 10);
}

- (CGFloat)height:(NSUInteger )indexPath {
    if ([self.delegate respondsToSelector:@selector(waterfallLayoutHeightForItemAtIndex:)]) {
        return [self.delegate waterfallLayoutHeightForItemAtIndex:indexPath];
    }
    return 0.f;
}

//返回indexPath位置cell对应的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat collectionView_width = self.collectionView.frame.size.width;
    
    CGFloat w = (collectionView_width - [self edgeInsets].left - [self edgeInsets].right - (self.columnCount -1)*self.columnMargin) / self.columnCount;
    CGFloat h = [self height:indexPath.item];
    CGFloat x = 0.f;
    CGFloat y = 0.f;
    
    NSUInteger min_height_index = 0;
    
    if (indexPath.item < self.columnCount) {
        //First row
        x = [self edgeInsets].left + (indexPath.item % self.columnCount) * (w + self.columnMargin);
        y = [self edgeInsets].top;
    }else{
        
        //Find the min height for the item from lastRowAttris.
        UICollectionViewLayoutAttributes *attris_has_min_height = [self.lastRowAttris objectAtIndex:min_height_index];
        for (int i=1; i<self.lastRowAttris.count; i++) {
            UICollectionViewLayoutAttributes *next = [self.lastRowAttris objectAtIndex:i];
            if ((attris_has_min_height.frame.origin.y + attris_has_min_height.frame.size.height) > (next.frame.origin.y + next.frame.size.height)) {
                attris_has_min_height = next;
                min_height_index = i;
            }
        }
        
        x = attris_has_min_height.frame.origin.x;
        y = attris_has_min_height.frame.origin.y + attris_has_min_height.frame.size.height + self.rowMargin;
    }
    
    attrs.frame = CGRectMake(x, y, w, h);
    
    if (self.lastRowAttris.count == 4) {
        [self.lastRowAttris replaceObjectAtIndex:min_height_index withObject:attrs];
    }else {
        [self.lastRowAttris insertObject:attrs atIndex:(indexPath.item % self.columnCount)];
    }
    
    
    CGFloat visible_h = y + h + self.rowMargin + [self edgeInsets].bottom;
    if (self.contentHeight < visible_h) {
        self.contentHeight = visible_h;
    }
    
    return attrs;
}


// 布局在前面准备好，layoutAttributesForElementsInRect 调用频繁
//决定 cell 的布局
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attrisArray;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(0, (self.contentHeight + [self edgeInsets].bottom));
}

@end
