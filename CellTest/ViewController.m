//
//  ViewController.m
//  CellTest
//
//  Created by user on 16/5/27.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "SPCollectionViewCell.h"

NSString *cellIdentifier = @"cellIdentifier";

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionViewFlowLayout *flowlayout;
@property BOOL firstLayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    UINib *nib = [UINib nibWithNibName:@"SPCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.mainCollectionView registerNib:nib forCellWithReuseIdentifier:cellIdentifier];
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

@end
