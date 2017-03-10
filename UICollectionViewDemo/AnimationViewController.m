//
//  AnimationViewController.m
//  UICollectionViewDemo
//
//  Created by ptmind on 09/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "AnimationViewController.h"
#import "DemoCollectionViewCell.h"
#import "DemoFlowLayout.h"

@interface AnimationViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *items;
@end


static NSString *const reusedIndicator = @"demo_collection_view_cell";

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.items = [NSMutableArray new];
    [self.items addObject:@"0"];
    [self.items addObject:@"1"];
    
    
    UIBarButtonItem *addBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCell:)];
    UIBarButtonItem *removeBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(removeCell:)];
    
    self.navigationItem.rightBarButtonItems = @[addBarButtonItem, removeBarButtonItem];
    
    //UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //flowLayout.minimumLineSpacing = 5.f;
    //flowLayout.minimumInteritemSpacing = 10.f;
    //flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //flowLayout.itemSize = CGSizeMake(50, 50);
    
    DemoFlowLayout *dfl = [[DemoFlowLayout alloc]init];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:dfl];
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

- (void)addCell:(id)sender {
    [self.items addObject:@"2"];
    
    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:(self.items.count -1) inSection:0]]];

    
//    __weak __typeof(self) weakSelf = self;
//    [self.collectionView performBatchUpdates:^{
//        __strong __typeof(weakSelf) strongSelf = weakSelf;
//        if (strongSelf) {
//            [strongSelf.items addObject:@"1"];
//            [strongSelf.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:(strongSelf.items.count -1) inSection:0]]];
//
//        }
//    } completion:^(BOOL finished) {
//        __strong __typeof(weakSelf) strongSelf = weakSelf;
//        if (strongSelf) {
//            [strongSelf.collectionView reloadData];
//        }
//    }];
}

- (void)removeCell:(id)sender {
    [self.items removeLastObject];
    [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:(self.items.count) inSection:0]]];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reusedIndicator forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    __weak __typeof(self)weakSelf = self;
//    [collectionView performBatchUpdates:^{
//        [collectionView deleteItemsAtIndexPaths:@[indexPath]];
//        [weakSelf.items removeObjectAtIndex:indexPath.row];
//    } completion:^(BOOL finished) {
//        
//    }];
}

@end
