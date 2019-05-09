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
@end

@implementation HZY_AddressC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tt_addnavgarItme];
    
}
#pragma mark 回调协议


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


#pragma mark 公开方法

- (void)tt_addSubviews {
    [self setupTableV:[HZY_MyaddressTableV class]];
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        HZY_MyaddressModel *model = [[HZY_MyaddressModel alloc]init];
        [arr addObject:model];
    }
    [self.TableV configDataNew:arr has_more:NO];
    
    
}

#pragma mark 私有方法


- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"SHDZ");
}


- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    [self wr_setNavBarShadowImageHidden:NO];
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
