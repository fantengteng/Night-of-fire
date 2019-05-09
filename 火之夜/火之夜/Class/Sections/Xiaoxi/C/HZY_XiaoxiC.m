//
//  HZY_XiaoxiC.m
//  火之夜
//
//  Created by linlin dang on 2019/4/29.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_XiaoxiC.h"
#import "HZY_xiaoxiTableV.h"
#import "HZY_FabuC.h"
@interface HZY_XiaoxiC ()
@property (nonatomic , strong) HZY_xiaoxiTableV *TableV;
@end

@implementation HZY_XiaoxiC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    
}

#pragma mark 回调协议

#pragma mark 界面跳转

#pragma mark 触发方法

#pragma mark 公开方法

- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"消息");
}

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[HZY_xiaoxiTableV class]Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H - 49)];
    [self setupVM:[HomeVM class]];
}

- (void)configData {
    [self configDataforNewnetWorkname:msgListMARK params:[NSMutableDictionary new] networkClass:[HomeAPI class]];
}

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.TableV.is_refreshfoot = YES;
    self.TableV.is_refreshHeader = YES;
    [self wr_setNavBarShadowImageHidden:NO];
}


#pragma mark 存取方法

@end
