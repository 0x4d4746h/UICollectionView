//
//  HomeTableViewController.m
//  UICollectionViewDemo
//
//  Created by ptmind on 07/03/2017.
//  Copyright © 2017 ptmind. All rights reserved.
//

#import "HomeTableViewController.h"
#import "BaseViewController.h"
#import "AnimationViewController.h"
#import "WaterfallViewController.h"

#import "Person.h"
#import "NSObject+KVO.h"

@interface HomeTableViewController ()
@property (nonatomic, strong) NSArray *datas;
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = @[@"1. 最基本的流水线布局 - Storyboard", @"2. 最基本的流水线布局 - 代码", @"3. 自定义插入、删除 cell 的动画", @"4. 线性布局和圆形布局", @"5. 瀑布流布局"];
    
    Person *p = [Person new];
    
    [p xf_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    //[p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    p.age = 10;

}

- (void)willChangeValueForKey:(NSString *)key {
    NSLog(@"%s, %@", __FUNCTION__, key);
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"%s, %@", __FUNCTION__, key);
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%s, %@", __FUNCTION__, keyPath);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"datasCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.datas objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"ToBaseCollectionViewController" sender:nil];
    }else if(indexPath.row == 1) {
        BaseViewController *bvc = [[BaseViewController alloc]init];
        [bvc.view setFrame:self.view.frame];
        [self.navigationController pushViewController:bvc animated:YES];
    }else if (indexPath.row == 2) {
        AnimationViewController *avc = [[AnimationViewController alloc]init];
        [avc.view setFrame:self.view.frame];
        [self.navigationController pushViewController:avc animated:YES];
    }else if (indexPath.row == 4) {
        WaterfallViewController *wvc = [[WaterfallViewController alloc]init];
        [wvc.view setFrame:self.view.frame];
        [self.navigationController pushViewController:wvc animated:YES];
    }
    
}

@end
