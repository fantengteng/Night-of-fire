//
//  MyC.m
//  火之夜
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "MyC.h"
#import "HZY_MygoumaiC.h"
#import "HZY_MyfabuC.h"
#import "HZY_AddressC.h"
#import "HZY_FabuC.h"
#import "HZY_MyinfoC.h"
#import "HZY_SetUpC.h"
#import "HZY_HongbaoC.h"
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSString *MAT_page = [NSString stringWithFormat:@"%s",object_getClassName(self)];
    TT_Log(@"%@",MAT_page);
    if (![MAT_page isEqualToString:@"HZY_FabuC"] ||![MAT_page isEqualToString:@"HZY_XinxianC"] ||![MAT_page isEqualToString:@"HZY_RemenC"]) {
        @weakify(self)
        [TabBarTool Share_TabBarTool].ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
            @strongify(self)
            [[TabBarTool Share_TabBarTool]configisLoginv:self];
            [self JumpController:[[HZY_FabuC alloc]init]];
        };
    }
}

#pragma mark 回调协议

- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(id)model {
    
    
    if (index.row == 4) {
        [self jumpSetupC];
    }else {
        [[TabBarTool Share_TabBarTool]configisLoginv:self];
        if (index.row == 0) {
            [self jumpMygoumaiC];
        }else if (index.row == 1) {
            [self jumpMyfabuC];
        }else if (index.row == 3) {
            [self jumpshouhuodizhi];
        }else if (index.row == 2) {
            [self jumpHongbaoC];
        }
    }
}


- (void)tt_allClose {
    @weakify(self)
    self.TableV.tapClose = ^(NSInteger num, id data) {
        @strongify(self)
        [[TabBarTool Share_TabBarTool]configisLoginv:self];
        [self jumpMyinfoC];
    };
}
#pragma mark 界面跳转

- (void)jumpHongbaoC {
    HZY_HongbaoC *HC = [[HZY_HongbaoC alloc]init];
    [self JumpController:HC];
    
}

- (void)jumpMyinfoC {
    HZY_MyinfoC *infoC = [[HZY_MyinfoC alloc] initWithNibName:@"HZY_MyinfoC" bundle:nil];
    [self JumpController:infoC];
}

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

- (void)jumpSetupC {
    HZY_SetUpC *infoC = [[HZY_SetUpC alloc] initWithNibName:@"HZY_SetUpC" bundle:nil];
    [self JumpController:infoC];
}
#pragma mark 触发方法

#pragma mark 公开方法

- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"我的");
}

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[HZY_MyTableV class]Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H - 49)];
    [self tt_allClose];
}


#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
}

#pragma mark 存取方法


@end
