//
//  HomeBannerV.m
//  火之夜
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_HomeBannerV.h"
#import "ZKCycleScrollView.h"
#import "HZY_MallBannerCell.h"
#import "HZY_BannerModel.h"
@interface HZY_HomeBannerV ()<ZKCycleScrollViewDelegate, ZKCycleScrollViewDataSource>
@property (nonatomic , strong) ZKCycleScrollView *BannerV;
@property (nonatomic , strong) NSMutableArray *Banner;
@end
@implementation HZY_HomeBannerV

#pragma mark 生命周期

#pragma mark 回调协议
- (NSInteger)numberOfItemsInCycleScrollView:(ZKCycleScrollView *)cycleScrollView {
    return self.Banner.count;
}

- (__kindof ZKCycleScrollViewCell *)cycleScrollView:(ZKCycleScrollView *)cycleScrollView cellForItemAtIndex:(NSInteger)index {
    HZY_MallBannerCell *cell = [cycleScrollView dequeueReusableCellWithReuseIdentifier:@"Cellbanner" forIndex:index];
    HZY_BannerModel *model = self.Banner[index];
    cell.imageURL = [NSURL URLWithString:[[[NSString alloc]init] base64DecodeString:model.picurl]];
    return cell;
}


#pragma mark 触发方法



#pragma mark 公开方法

- (void)configData:(NSMutableArray *)data {
    self.Banner = data;
    [self.BannerV reloadData];
}

#pragma mark 私有方法

- (void)tt_setupViews {
    self.backgroundColor = Col_F6F;
    [self addSubview:self.BannerV];
    self.BannerV.delegate = self;
    self.BannerV.dataSource = self;
}



#pragma mark 存取方法

- (ZKCycleScrollView *)BannerV {
    if (!_BannerV) {
        _BannerV = [[ZKCycleScrollView alloc] initWithFrame:CGRectMake(0.f, 0.f, KScreenWidth ,(KScreenWidth - 20) / 25 * 9  + 10)];
        _BannerV.backgroundColor = Col_FFF;
        [_BannerV registerCellClass:[HZY_MallBannerCell class] forCellWithReuseIdentifier:@"Cellbanner"];
    }
    return _BannerV;
}

- (NSMutableArray *)Banner {
    if (!_Banner) {
        _Banner = [NSMutableArray new];
    }
    return _Banner;
}

@end
