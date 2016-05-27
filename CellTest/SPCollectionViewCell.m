//
//  SPCollectionViewCell.m
//  CellTest
//
//  Created by user on 16/5/27.
//  Copyright © 2016年 user. All rights reserved.
//

#import "SPCollectionViewCell.h"
#import "DetailTableViewCell.h"

@implementation SPCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        [self.tableView registerNib:[UINib nibWithNibName:@"DetailTableViewCell" bundle:nil] forCellReuseIdentifier:TableViewCellIdentifier];
        [self.contentView addSubview:self.tableView];
    }
    
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableView.frame = self.contentView.bounds;
}
- (void)setTableViewDataSourceDelegate:(id<UITableViewDataSource,UITableViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath {
    self.tableView.dataSource = dataSourceDelegate;
    self.tableView.delegate = dataSourceDelegate;
    [self.tableView reloadData];
}
@end
