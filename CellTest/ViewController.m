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
    DetailTableViewCell *cell = (DetailTableViewCell *)[tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier forIndexPath:indexPath];
    cell.nameLabel.text = @"盼望著，盼望著，東風來了，春天的腳步近了。一切都像剛睡醒的樣子欣欣然張開了眼。山朗潤起來了，水長起來了，太陽的臉紅起來了。\
    小草偷偷地從土裏鑽出來嫩嫩的，綠綠的。園子裏，田野裏，瞧去，一大片一大片滿是的。坐著，躺著，打兩個滾，踢幾腳球，賽幾趟跑，捉幾回迷藏。風輕悄悄的，草綿軟軟的。\
    \
    桃樹、杏樹、梨樹，你不讓我，我不讓你，都開滿了花趕趟兒。紅的像火，粉的像霞，白的像雪。花裏帶著甜味，閉了眼，樹上倣佛已經滿是桃兒、杏兒、梨兒！花下成千成百的蜜蜂嗡嗡地鬧著，大小的蝴蝶飛來飛去。野花遍地是：雜樣兒，有名字的，沒名字的，散在草叢裏，像眼睛，像星星，還眨呀眨的。\
    \
    「吹面不寒楊柳風」，不錯的，像母親的手撫摸著你。風裏帶來些新翻的泥土的氣息，混著青草味，還有各種花的香，都在微微潤溼的空氣裏醞釀。鳥兒將窠巢安在繁花嫩葉當中高興起來了，呼朋引伴地賣弄清脆的喉嚨，唱出宛轉的曲子，與輕風流水應和著。牛背上牧童的短笛，這時候也成天在嘹亮地響。\
    \
    雨是最尋常的，一下就是三兩天。可別惱，看，像牛毛，像花針，像細絲，密密地斜織著，人家屋頂上全籠著一層薄煙。樹葉子卻綠得發亮，小草也青得逼你的眼。傍晚時候，上燈了，一點點黃暈的光，烘托出一片安靜而和平的夜。鄉下去，小路上，石橋邊，撐起傘慢慢走著的人；還有地裏工作的農夫，披著蓑，戴著笠的。他們的草屋，稀稀疏疏的在雨裏靜默著。\
    \
    天上風箏漸漸多了，地上孩子也多了。城裏鄉下，家家戶戶，老老小小，他們也趕趟兒似的，一個個都出來了。舒活舒活筋骨，抖擻抖擻精神，各做各的一份事去。「一年之計在於春」；剛起頭兒，有的是工夫，有的是希望。\
    \
    春天像剛落地的娃娃，從頭到腳都是新的，它生長著。\
    \
    春天像小姑娘，花枝招展的，笑著，走著。\
    \
    春天像健壯的青年，有鐵一般的胳膊和腰腳，他領著我們上前去。";
    
    return cell;
}


@end
