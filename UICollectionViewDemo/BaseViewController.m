//
//  BaseViewController.m
//  UICollectionViewDemo
//
//  Created by ptmind on 09/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "BaseViewController.h"
#import "DemoCollectionViewCell.h"

static NSString *const reusedIndicator = @"demo_collection_view_cell";

@interface BaseViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 5.f;
    flowLayout.minimumInteritemSpacing = 10.f;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(100, 120);
    flowLayout.sectionInset = UIEdgeInsetsMake(50, 15, 20, 15);
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.alwaysBounceVertical = YES;
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[DemoCollectionViewCell class] forCellWithReuseIdentifier:reusedIndicator];
    
    self.collectionView.backgroundColor = [UIColor grayColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusedIndicator forIndexPath:indexPath];
    return cell;
}


@end
