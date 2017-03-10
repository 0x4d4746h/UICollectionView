//
//  WaterfallLayoutDelegate.h
//  UICollectionViewDemo
//
//  Created by ptmind on 09/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import <UIKit/UIkit.h>

@protocol WaterfallLayoutDelegate <NSObject>

@required
- (CGFloat)waterfallLayoutHeightForItemAtIndex:(NSUInteger)index;

@optional
- (UIEdgeInsets)waterfallLayoutEdgeInsets;

@end
