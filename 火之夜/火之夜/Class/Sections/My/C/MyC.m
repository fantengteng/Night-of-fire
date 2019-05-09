//
//  MyC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyC.h"
#import "HZY_MygoumaiC.h"
#import "HZY_MyfabuC.h"
#import "HZY_AddressC.h"
#import "HZY_FabuC.h"
@interface MyC ()
@property (nonatomic , strong) HZY_MyTableV *TableV;
@end

@implementation MyC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.TableV configDataNew:@"" has_more:NO];
}
#pragma mark 回调协议

- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(id)model {
    if (index.row == 0) {
        [self jumpMygoumaiC];
    }else if (index.row == 1) {
        [self jumpMyfabuC];
    }else if (index.row == 2) {
        [self jumpshouhuodizhi];
    }else if (index.row == 3) {
        
    }
}

#pragma mark 界面跳转

- (void)jumpMygoumaiC {
    HZY_MygoumaiC *GM = [[HZY_MygoumaiC alloc]init];
    [self.navigationController pushViewController:GM animated:YES];
}

- (void)jumpMyfabuC {
    HZY_MyfabuC *FC = [[HZY_MyfabuC alloc]init];
    [self.navigationController pushViewController:FC animated:YES];
}

- (void)jumpshouhuodizhi {
    HZY_AddressC *AC = [[HZY_AddressC alloc]init];
    [self.navigationController pushViewController:AC animated:YES];
}

#pragma mark 触发方法

#pragma mark 公开方法

- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"我的");
}

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[HZY_MyTableV class]Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H - 49)];
}


#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    [self wr_setNavBarShadowImageHidden:NO];
}

#pragma mark 存取方法


@end
