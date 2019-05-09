//
//  HZY_MyfabuC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/1.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_MyfabuC.h"
#import "HZY_MyfabuCollectionV.h"
@interface HZY_MyfabuC ()
@property (nonatomic , strong) HZY_MyfabuCollectionV *CollectionV;
@end

@implementation HZY_MyfabuC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    
}
#pragma mark 回调协议


#pragma mark 界面跳转

#pragma mark 触发方法

#pragma mark 公开方法

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupCollectionV:[HZY_MyfabuCollectionV class]];
}

- (void)configData {
    USER_ID
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@"3" forKey:@"type"];
    [dic setValue:usee_id forKey:@"memberId"];
    [dic setValue:@(self.CollectionV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:getProductInfoMARK params:dic networkClass:[HomeAPI class]];
}

#pragma mark 私有方法


- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"WDFB");
}


- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    [self wr_setNavBarShadowImageHidden:NO];
}

#pragma mark 存取方法

@end
