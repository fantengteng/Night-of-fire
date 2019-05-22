//
//  HZY_AddressC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/6.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_AddressC.h"
#import "HZY_NyAddnewAddressC.h"
#import "HZY_MyaddressModel.h"
#import "HZY_MyaddressTableV.h"

@interface HZY_AddressC ()
@property (nonatomic , strong) HZY_MyaddressTableV *TableV;
@property (nonatomic , strong) HZY_MyaddressModel *model;
@end

@implementation HZY_AddressC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tt_addnavgarItme];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configData];
}
#pragma mark 回调协议

- (void)tt_allClose {
    @weakify(self)
    self.TableV.tapClose = ^(NSInteger num, id data) {
        @strongify(self)
        [self configtableViewmethod:num model:data];
    };
}

#pragma mark 界面跳转

- (void)jump_addnewaddress:(HZY_MyaddressModel *)model {
    HZY_NyAddnewAddressC *AC = [[HZY_NyAddnewAddressC alloc] initWithNibName:@"HZY_NyAddnewAddressC" bundle:nil];
    AC.addressModel = model;
    [self.navigationController pushViewController:AC animated:YES];
}


#pragma mark 触发方法

- (void)addnewaddress {
    [self jump_addnewaddress:nil];
}

- (void)setupAddressMARK:(NSString *)MARK {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    USER_ID
    [dic setValue:usee_id forKey:@"memberId"];
    [dic setValue:@(self.model.ID) forKey:@"id"];
    [self configDataforNewnetWorkname:MARK params:dic networkClass:[HomeAPI class]];
}

/// 1 删除 2编辑 3默认
- (void)configtableViewmethod:(NSInteger)type model:(id)model{
    self.model = model;
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"正在提交>>>" AndView:self.view AndMode:MBProgressHUDModeIndeterminate AndImage:@"NONONO" AndBack:nil];
    if (type == 1) {
        [self setupAddressMARK:deleteAddressMARK];
    }else if (type == 2) {
        [self jump_addnewaddress:model];
    }else if (type == 3) {
        [self setupAddressMARK:updateAddrIsDefaultMARK];
    }
}
#pragma mark 公开方法

- (void)tt_addSubviews {
    [self setupTableV:[HZY_MyaddressTableV class]];
    [self tt_allClose];
}

- (void)configData {
    USER_ID
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:usee_id forKey:@"memberId"];
    [dic setValue:@"1" forKey:@"addType"];
    [self configDataforNewnetWorkname:queryAddrsMARK params:dic networkClass:[HomeAPI class]];
}

- (void)configSuccessTankuang:(NSString *)mark {
    NSString *STT;
    if ([mark isEqualToString:deleteAddressMARK]) {
        STT = @"删除成功";
        [self configData];
    }else if ([mark isEqualToString:updateAddrIsDefaultMARK]) {
        STT = @"默认地址，设置成功";
        for (HZY_MyaddressModel *model in self.TableV.infodata) {
            model.Default = 0;
        }
        self.model.Default = 1;
        [self.TableV reloadData];
    }
    [self configTankuangTitle:STT imageName:@"NININI" Back:^{
        
    }];
}

#pragma mark 私有方法


- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"SHDZ");
}


- (void)tt_changeDefauleConfiguration {

}

- (void)tt_addnavgarItme {
    UIButton *btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(0, 0, 40, 40)
                                                          taeget:self
                                                             sel:@selector(addnewaddress)
                                                             tag:0
                                                        AntTitle:LOCALIZATION(@"添加")
                                                       titleFont:14
                                                      titleColor:Col_D81
                                                        andImage:nil
                                                    AndBackColor:nil
                                         adjustsFontSizesTowidth:NO
                                                   masksToBounds:NO
                                                    conrenRadius:0
                                                     BorderColor:nil
                                                     BorderWidth:0
                                       ContentHorizontalAligment:0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

#pragma mark 存取方法
@end
