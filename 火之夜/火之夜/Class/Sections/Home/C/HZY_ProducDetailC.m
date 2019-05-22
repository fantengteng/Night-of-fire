//
//  HZY_ProducDetailC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/7.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_ProducDetailC.h"
#import "HZY_ProductInfoModel.h"
#import "HZY_ProducTableV.h"
#import "HZY_OrderPayInterfaceC.h"
@interface HZY_ProducDetailC ()
@property (nonatomic , strong) HZY_ProducTableV *TableV;
@end

@implementation HZY_ProducDetailC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Col_FFF;

}

#pragma mark 回调协议

#pragma mark 界面跳转

- (void)jump_OrderPayInterfaceC {
    HZY_OrderPayInterfaceC *OC = [[HZY_OrderPayInterfaceC alloc]init];
    OC.Model = self.Model;
    [self.navigationController pushViewController:OC animated:YES];
}

#pragma mark 触发方法

- (void)Tap {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)Tap_Close {
    [self jump_OrderPayInterfaceC];
}

#pragma mark 公开方法

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[HZY_ProducTableV class] Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H - 50)];
    [self.TableV configDataNew:[NSMutableArray arrayWithObject:self.Model] has_more:NO];

}


#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    IPhoneXHeigh
    UIButton *Btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(0, KScreenHeight - securityBottom_H - 50, KScreenWidth, 50)
                                                          taeget:self
                                                             sel:@selector(Tap_Close)
                                                             tag:0
                                                        AntTitle:LOCALIZATION(@"我想要") 
                                                       titleFont:16
                                                      titleColor:Col_FFF
                                                        andImage:Nil
                                                    AndBackColor:Col_D81
                                         adjustsFontSizesTowidth:NO
                                                   masksToBounds:NO
                                                    conrenRadius:0
                                                     BorderColor:nil
                                                     BorderWidth:0
                                       ContentHorizontalAligment:0];
    Btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:Btn];
}

#pragma mark 存取方法

@end
