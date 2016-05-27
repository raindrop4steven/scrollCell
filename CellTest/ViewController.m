//
//  ViewController.m
//  CellTest
//
//  Created by user on 16/5/27.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "SPCollectionViewCell.h"
#import "DetailTableViewCell.h"

NSString *cellIdentifier = @"cellIdentifier";

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UICollectionViewFlowLayout *flowlayout;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property BOOL firstLayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[NSMutableArray alloc] initWithObjects:@"1st", @"2nd", @"3rd", @"4th", @"5th", nil];
    
    self.firstLayout = NO;

    self.flowlayout = [[UICollectionViewFlowLayout alloc] init];
    [self.flowlayout setItemSize:self.mainCollectionView.frame.size];
    [self.flowlayout setMinimumInteritemSpacing:0];
    [self.flowlayout setMinimumLineSpacing:0];
    [self.flowlayout setSectionInset:UIEdgeInsetsZero];
    [self.flowlayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    self.mainCollectionView.collectionViewLayout = self.flowlayout;
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    self.mainCollectionView.pagingEnabled = YES;
    self.mainCollectionView.bounces = NO;
    self.mainCollectionView.showsHorizontalScrollIndicator = NO;
    self.mainCollectionView.backgroundColor = [UIColor clearColor];
    
    [self.mainCollectionView registerClass:[SPCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (!self.firstLayout) {
        self.firstLayout = YES;
        [self.flowlayout setItemSize:self.mainCollectionView.bounds.size];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SPCollectionViewCell *cell = (SPCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row % 3 == 0)
        cell.backgroundColor = [UIColor redColor];
    else if (indexPath.row % 3 == 1)
        cell.backgroundColor = [UIColor greenColor];
    else
        cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(SPCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [cell setTableViewDataSourceDelegate:self indexPath:indexPath];
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"index path : %ld", indexPath.row);
    
    DetailTableViewCell *cell = (DetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier forIndexPath:indexPath];
    cell.nameLabel.text = [self.dataSource objectAtIndex: [(MyTableView *)tableView indexPath].row];
    
    return cell;
}


@end
