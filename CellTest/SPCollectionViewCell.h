//
//  SPCollectionViewCell.h
//  CellTest
//
//  Created by user on 16/5/27.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *TableViewCellIdentifier = @"TableViewCellIdentifier";

@interface MyTableView : UITableView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end

@interface SPCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)MyTableView *tableView;

- (void)setTableViewDataSourceDelegate:(id<UITableViewDataSource, UITableViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;
@end
