//
//  DemoFlowLayout.m
//  UICollectionViewDemo
//
//  Created by ptmind on 09/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "DemoFlowLayout.h"
#import <CoreGraphics/CoreGraphics.h>


@implementation DemoFlowLayout


/**
 * 当collectionView的显示范围发生改变的时候，是否需要重新刷新布局
 * 一旦重新刷新布局，就会重新调用下面的方法：
 1.prepareLayout
 2.layoutAttributesForElementsInRect:方法
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


/**
 *  用来做布局的初始化操作，不建议在init方法中进行布局的初始化操作
 */
- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.minimumLineSpacing = 5.f;
    self.minimumInteritemSpacing = 10.f;
    self.itemSize = CGSizeMake(50, 50);
}

- (void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems {
    [super prepareForCollectionViewUpdates:updateItems];
    
    //NSLog(@"%@", updateItems);
    
    for (UICollectionViewUpdateItem *update in updateItems) {
        if (update.updateAction == UICollectionUpdateActionInsert) {
            NSLog(@"index: %@", update.indexPathAfterUpdate);
        }
    }
}


- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    //NSLog(@"%s, %ld", __FUNCTION__, itemIndexPath.row);
    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    
//    attributes.transform = CGAffineTransformRotate(CGAffineTransformMake(1, 0, 1, 0, 0.2, 0.2), (M_PI));
//    attributes.center = CGPointMake(CGRectGetMidX(self.collectionView.bounds), CGRectGetMaxX(self.collectionView.bounds));
//    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    //NSLog(@"%s, %ld", __FUNCTION__, itemIndexPath.row);
    UICollectionViewLayoutAttributes *attributes =  [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
    
    attributes.transform = CGAffineTransformRotate(CGAffineTransformMake(1, 0, 1, 0, 0.2, 0.2), (M_PI));
    attributes.center = CGPointMake(CGRectGetMaxX(self.collectionView.bounds), CGRectGetMaxY(self.collectionView.bounds));
    
    return attributes;
}


@end
