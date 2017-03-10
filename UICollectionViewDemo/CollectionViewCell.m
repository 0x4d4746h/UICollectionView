//
//  CollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by ptmind on 07/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.cellView.backgroundColor = [UIColor yellowColor];
}
@end
