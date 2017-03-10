//
//  WaterfallViewController.m
//  UICollectionViewDemo
//
//  Created by ptmind on 09/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "WaterfallViewController.h"
#import "DemoCollectionViewCell.h"
#import "WaterfallLayout.h"

@interface WaterfallViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, WaterfallLayoutDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString *const reusedIndicator = @"demo_collection_view_cell";

@implementation WaterfallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    flowLayout.minimumLineSpacing = 5.f;
//    flowLayout.minimumInteritemSpacing = 10.f;
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    flowLayout.itemSize = CGSizeMake(50, 50);
    
    WaterfallLayout *wl = [WaterfallLayout new];
    wl.delegate = self;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:wl];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    self.collectionView.alwaysBounceVertical = YES;
    
    [self.collectionView registerClass:[DemoCollectionViewCell class] forCellWithReuseIdentifier:reusedIndicator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 17;//self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusedIndicator forIndexPath:indexPath];
    cell.infoLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.item];
    return cell;
}

#pragma mark - WaterfallLayoutDelegate
- (CGFloat)waterfallLayoutHeightForItemAtIndex:(NSUInteger)index {
    return 50.f + arc4random_uniform(100);
}
- (UIEdgeInsets)waterfallLayoutEdgeInsets {
    return UIEdgeInsetsMake(12.5, 10, 10, 10);
}

@end
