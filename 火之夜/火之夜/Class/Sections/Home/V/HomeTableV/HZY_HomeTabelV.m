//
//  HZY_HomeTabelV.m
//  火之夜
//
//  Created by linlin dang on 2019/4/30.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_HomeTabelV.h"
#import "HZY_HomeBannerV.h"
#import "XXPageTabView.h"
@interface HZY_HomeTabelV ()<XXPageTabViewDelegate>

@property (nonatomic , strong) HZY_HomeBannerV *bannerV;

@property (nonatomic , strong) XXPageTabView *pageTableView;

@end

@implementation HZY_HomeTabelV



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =[[UITableViewCell alloc]init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.contentView addSubview:self.pageTableView];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    IPhoneXHeigh
    return self.bounds.size.height;
}

- (void)titleColorBeginChange:(NSInteger)selectIndex {
    if (self.tapClose) {
        self.tapClose(selectIndex, @"");
    }
}

- (void)configDataNew:(id)Data has_more:(BOOL)has_more {
    [self.bannerV configData:Data];
}

- (void)changeDefaultConfigguration {
    self.is_GestureEvent = YES;
    self.tableHeaderView = self.bannerV;
}

- (void)initWithTabBarControllers:(NSArray<UIViewController *> *)controllers childTitles:(NSArray *)childTitles {
    self.pageTableView = [[XXPageTabView alloc]initWithFrame:self.bounds Controllers:controllers  childTitles:childTitles];
    self.pageTableView.isShowLine      = 1;
    self.pageTableView.delegate        = self;
    self.pageTableView.tabItemX        = 20;
    self.pageTableView.tabSize         = CGSizeMake(KScreenWidth - 40, 55);
    self.pageTableView.titleStyle      = XXPageTabTitleStyleDefault;
    self.pageTableView.indicatorWidth  = 20;
    self.pageTableView.tabItemFont     = [UIFont systemFontOfSize:16];
    self.pageTableView.indicatorStyle  = XXPageTabTitleStyleDefault;
    self.pageTableView.unSelectedColor = Col_666;
    self.pageTableView.selectedColor   = Col_D81;

    self.delegate = self;
    self.dataSource = self;
    [self reloadData];
}


- (HZY_HomeBannerV *)bannerV {
    if (!_bannerV) {
        _bannerV = [[HZY_HomeBannerV alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, (KScreenWidth - 20) / 25 * 9  + 20)];
    }
    return _bannerV;
}


@end
