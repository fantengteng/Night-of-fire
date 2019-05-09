//
//  HZY_MygoumaiC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/1.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_MygoumaiC.h"
#import "HZY_XinxianCollectionV.h"
@interface HZY_MygoumaiC ()
@property (nonatomic , strong) HZY_XinxianCollectionV *CollectionV;
@end

@implementation HZY_MygoumaiC


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
    [self setupCollectionV:[HZY_XinxianCollectionV class]];    
}

- (void)configData {
    [self configDataforNewnetWorkname:mybuyMARK params:[NSMutableDictionary new] networkClass:[HomeAPI class]];
}


#pragma mark 私有方法


- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"WDGM");
}


- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    [self wr_setNavBarShadowImageHidden:NO];
}

#pragma mark 存取方法



@end
