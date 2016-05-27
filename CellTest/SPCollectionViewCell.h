//
//  SPCollectionViewCell.h
//  CellTest
//
//  Created by user on 16/5/27.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *TableViewCellIdentifier = @"TableViewCellIdentifier";

@interface SPCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)UITableView *tableView;

- (void)setTableViewDataSourceDelegate:(id<UITableViewDataSource, UITableViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;
@end
