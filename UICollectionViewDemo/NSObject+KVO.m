//
//  NSObject+KVO.m
//  UICollectionViewDemo
//
//  Created by ptmind on 13/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import "XFKVONotifying_Person.h"

@implementation NSObject (KVO)


- (void)xf_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    
    object_setClass(self, [XFKVONotifying_Person class]);
    

    //添加关联,把观察者保存到当前对象里
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);


}

@end
