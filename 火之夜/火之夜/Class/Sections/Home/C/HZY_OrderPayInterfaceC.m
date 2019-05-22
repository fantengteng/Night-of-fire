//
//  HZY_OrderPayInterfaceC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/13.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_OrderPayInterfaceC.h"
#import "CurrenC.h"
#import "HZY_NyAddnewAddressC.h"
#import "HZY_shopInfoV.h"
#import "HZY_shAddressV.h"
#import "HZY_paymoneyV.h"
#import "HZY_AddressC.h"
#import "HZY_hongbaoV.h"
#import "HZY_HongbaoC.h"
@interface HZY_OrderPayInterfaceC ()<HZY_HngbaoCDelegate>
@property (nonatomic , strong) HZY_shopInfoV *SV;
@property (nonatomic , strong) HZY_shAddressV *AV;
@property (nonatomic , strong) HZY_paymoneyV *pavV;
@property (nonatomic , strong) HZY_hongbaoV *hongbaoV;
@property (nonatomic , strong) HZY_MyaddressModel *My_model;
@end

@implementation HZY_OrderPayInterfaceC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configData];
}

#pragma mark 回调协议


- (void)tap_money:(NSString *)moeney {
    NSInteger mo = (self.Model.price -  [moeney integerValue] )< 0 ? 0 : (self.Model.price -  [moeney integerValue]);
    [self.hongbaoV configprice:moeney];
    [self.pavV configprice:mo];
}

- (void)tt_allClose {
    @weakify(self)
    self.AV.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (num == 0) {
            [self jump_addnewaddress:nil];
        }else {
            [self jumpMyaddressC];
        }
    };
    
    self.pavV.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (self.AV.type == 0) {
            [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"请添加收货地址" AndView:self.view AndMode:MBProgressHUDModeText AndImage:@"NIN" AndAfterDelay:1 AndBack:nil];
        }else {
            [self jumpCurreC];
        }
    };
    
    self.hongbaoV.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        [self jumpHongbaoC];
    };
}

#pragma mark 界面跳转


- (void)jump_addnewaddress:(HZY_MyaddressModel *)model {
    HZY_NyAddnewAddressC *AC = [[HZY_NyAddnewAddressC alloc] initWithNibName:@"HZY_NyAddnewAddressC" bundle:nil];
    AC.addressModel = model;
    [self.navigationController pushViewController:AC animated:YES];
}

- (void)jumpCurreC {
    CurrenC *CC = [[CurrenC alloc]init];
    CC.web_url = self.My_model.httpUrl;
    [self.navigationController pushViewController:CC animated:YES];
}

- (void)jumpHongbaoC {
    HZY_HongbaoC *HC = [[HZY_HongbaoC alloc]init];
    HC.type = 1;
    HC.HB_Delegate = self;
    [self JumpController:HC];
    
}


- (void)jumpMyaddressC {
    HZY_AddressC *AC = [[HZY_AddressC alloc]init];
    [self JumpController:AC];
}
#pragma mark 触发方法

#pragma mark 公开方法

- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"购买宝贝");
}

- (void)configData {
    USER_ID
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:usee_id forKey:@"memberId"];
    [dic setValue:@"3" forKey:@"addType"];
    [self configDataforNewnetWorkname:queryAddrsMARK params:dic networkClass:[HomeAPI class]];
}

- (void)configTabelData:(NSMutableArray *)arr has_more:(BOOL)has_more {
    if (arr.count == 0) {
        [self.AV configData:[[HZY_MyaddressModel alloc]init] istype:0];
    }else {
        self.My_model = arr[0];
        [self.AV configData:arr[0] istype:1];
    }
}

#pragma mark 私有方法

- (void)tt_addSubviews {
    [self.view addSubview:self.SV];
    [self.view addSubview:self.AV];
    [self.view addSubview:self.hongbaoV];
    [self.view addSubview:self.pavV];
    [self.SV configURl:self.Model.headimg[0] title:self.Model.title price:[NSString stringWithFormat:@"¥%ld", self.Model.price]];
    [self.pavV configprice:self.Model.price];
    [self tt_allClose];
    
}


#pragma mark 存取方法

- (HZY_shopInfoV *)SV {
    if (!_SV) {
        IPhoneXHeigh
        _SV = [[HZY_shopInfoV alloc]initWithFrame:CGRectMake(0, securitytop_Y + 10, KScreenWidth, 160)];
    }
    return _SV;
}

- (HZY_shAddressV *)AV {
    if (!_AV) {
        _AV = [[HZY_shAddressV alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.SV.frame) + 10, KScreenWidth, 170)];
    }
    return _AV;
}

- (HZY_paymoneyV *)pavV {
    if (!_pavV) {
        IPhoneXHeigh
        _pavV = [[HZY_paymoneyV alloc]initWithFrame:CGRectMake(0, KScreenHeight - securityBottom_H - 50, KScreenWidth, 50)];
    }
    return _pavV;
}

- (HZY_hongbaoV *)hongbaoV {
    if (!_hongbaoV) {
        _hongbaoV = [[HZY_hongbaoV alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.AV.frame) + 10, KScreenWidth, 50)];
    }
    return _hongbaoV;
}
@end
