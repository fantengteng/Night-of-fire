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

#pragma mark 触发方法

- (void)Tap {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 公开方法

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[HZY_ProducTableV class] Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H)];
    
    [self.TableV configDataNew:[NSMutableArray arrayWithObject:self.Model] has_more:NO];

}


- (void)confiitme {
    IPhoneXHeigh
    UIImage *image =  [UIImage imageNamed:@"fanhui"] ;
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton *btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(20, securitytop_Y - 44, 44, 44) taeget:self sel:@selector(Tap) tag:0 AntTitle:@"" titleFont:0 titleColor:nil andImage:@"fanhui" AndBackColor:nil adjustsFontSizesTowidth:NO masksToBounds:NO conrenRadius:0 BorderColor:nil BorderWidth:0 ContentHorizontalAligment:0]
    ;
    [self.view addSubview:btn];
}


#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    [self wr_setNavBarShadowImageHidden:NO];
}

#pragma mark 存取方法

@end
