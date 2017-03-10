//
//  WaterfallLayout.h
//  UICollectionViewDemo
//
//  Created by ptmind on 09/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterfallLayoutDelegate.h"

@interface WaterfallLayout : UICollectionViewLayout

@property (nonatomic, weak)id<WaterfallLayoutDelegate>delegate;
@end
