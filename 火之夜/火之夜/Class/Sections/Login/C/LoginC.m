//
//  LoginC.m
//  火之夜
//
//  Created by linlin dang on 2019/4/28.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "LoginC.h"
#import "RegisterV.h"
#import "loginV.h"
@interface LoginC ()
@property (nonatomic , strong) RegisterV *Regist;
@property (nonatomic , strong) loginV *Login;
@end

@implementation LoginC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark 回调协议

- (void)tt_allClose {
    @weakify(self)
    self.Regist.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (num == -1) {
            [self jumpzhuce:1];
        }else if(num == 0){
            [self configTankuangxinxi];
        }else {
            [self configLogininfo:data];
        }
    };
    
    self.Login.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (num == -1) {
            [self jumpzhuce:0];
        }else if(num == 0){
            [self configTankuangxinxi];
        }else {
            [self configRegistinfo:data];
        }
    };
}

#pragma mark 界面跳转

#pragma mark 触发方法

- (void)jumpzhuce:(NSInteger)type {
    if (type == 1) {
        self.title = LOCALIZATION(@"ZC");
        [self.Regist removeFromSuperview];
        [self.view addSubview:self.Login];
        
    }else {
        self.title = LOCALIZATION(@"DL");
        [self.Login removeFromSuperview];
        [self.view addSubview:self.Regist];
    }
}

- (void)configTankuangxinxi {
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:LOCALIZATION(@"请输入相应的信息")
                                      AndView:self.view
                                      AndMode:MBProgressHUDModeText
                                     AndImage:@"NONONO"
                                AndAfterDelay:1
                                      AndBack:nil];
}

- (void)configLogininfo:(NSMutableDictionary *)dic {
    [self configDataforNewnetWorkname:logonMAKR params:dic networkClass:[HomeAPI class]];
}

- (void)configRegistinfo:(NSMutableDictionary*)dic {
    [self configDataforNewnetWorkname:registerMARK params:dic networkClass:[HomeAPI class]];
}

#pragma mark 公开方法

- (void)tt_addSubviews {
    self.title = LOCALIZATION(@"DL");
    [self.view addSubview:self.Regist];
    [self tt_allClose];
}


- (void)configSuccessTankuang:(NSString *)mark {
    NSString *msg;
    if ([mark isEqualToString:logonMAKR]) {
        msg = LOCALIZATION(@"登录成功");
    }else {
        msg = LOCALIZATION(@"注册成功,请登录");
    }
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:msg
                                      AndView:self.view
                                      AndMode:MBProgressHUDModeText
                                     AndImage:@"NONONO"
                                AndAfterDelay:1 AndBack:^{
                                    [[TabBarTool Share_TabBarTool]CreateTabBar];
                                }];
}

- (void)RequstFailTankuangMarK:(NSString *)MarK {
    [self configFailTankuang:MarK];
}

- (void)configFailTankuang:(NSString *)mark {
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:LOCALIZATION(@"请求失败，请重试")
                                      AndView:self.view
                                      AndMode:MBProgressHUDModeText
                                     AndImage:@"NONONO"
                                AndAfterDelay:1
                                      AndBack:nil];
}

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
}

#pragma mark 存取方法

- (RegisterV *)Regist {
    if (!_Regist) {
        IPhoneXHeigh
        _Regist = [[[NSBundle mainBundle] loadNibNamed:@"RegisterV" owner:self options:nil] lastObject];;
        _Regist.frame = CGRectMake(0, securitytop_Y, KScreenWidth, security_H);
    }
    return _Regist;
}

- (loginV *)Login {
    if (!_Login) {
        IPhoneXHeigh
        _Login = [[[NSBundle mainBundle] loadNibNamed:@"loginV" owner:self options:nil] lastObject];;
        _Login.frame = CGRectMake(0, securitytop_Y, KScreenWidth, security_H);
    }
    return _Login;
}
@end
