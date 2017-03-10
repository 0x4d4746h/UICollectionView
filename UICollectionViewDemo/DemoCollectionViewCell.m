//
//  DemoCollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by ptmind on 09/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "DemoCollectionViewCell.h"

@implementation DemoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        
        self.infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width/2, frame.size.height/2)];
        [self.infoLabel setCenter:CGPointMake(frame.size.width/2, frame.size.height/2)];
        [self addSubview:self.infoLabel];
    }
    
    return self;
}

@end
