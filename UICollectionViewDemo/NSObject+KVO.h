//
//  NSObject+KVO.h
//  UICollectionViewDemo
//
//  Created by ptmind on 13/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (KVO)
- (void)xf_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
@end

NS_ASSUME_NONNULL_END
