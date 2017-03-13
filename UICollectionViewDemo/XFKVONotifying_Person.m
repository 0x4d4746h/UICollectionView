//
//  XFKVONotifying_Person.m
//  UICollectionViewDemo
//
//  Created by ptmind on 13/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "XFKVONotifying_Person.h"

@implementation XFKVONotifying_Person
-(void)setAge:(NSInteger)age {
    
    [super setAge:age];
    
    //取出观察者,并通知观察者属性改变
    id observer = objc_getAssociatedObject(self, @"observer");
    [observer observeValueForKeyPath:@"age" ofObject:observer change:nil context:nil];
    
}
@end
