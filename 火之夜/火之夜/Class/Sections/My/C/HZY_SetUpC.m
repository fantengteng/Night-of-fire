//
//  HZY_SetUpC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/13.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_SetUpC.h"
#import "CurrenC.h"
@interface HZY_SetUpC ()
@property (weak, nonatomic) IBOutlet UIButton *logout_btn;

@end

@implementation HZY_SetUpC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Is_hideJuhuazhuan = NO;
    self.view.backgroundColor = Col_FFF;
    self.logout_btn.layer.cornerRadius = 4;
    self.logout_btn.layer.masksToBounds = YES;
    self.bbxx.text = LOCALIZATION(@"版本信息");
    [self.fwxy setTitle:LOCALIZATION(@"服务协议") forState:UIControlStateNormal];
    [self.qchc setTitle:LOCALIZATION(@"清理缓存") forState:UIControlStateNormal];
    [self.logout setTitle:LOCALIZATION(@"退出登录") forState:UIControlStateNormal];
}

- (IBAction)jumpfuwuxieyi:(id)sender {
    CurrenC *CC = [[CurrenC alloc]init];
    CC.web_url = @"http://www.pozhu.com/huo2.html";
    [self.navigationController pushViewController:CC animated:YES];
}

- (IBAction)clearcache:(id)sender {
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:LOCALIZATION(@"正在清理缓存")
                                      AndView:self.view
                                      AndMode:MBProgressHUDModeIndeterminate
                                     AndImage:@"POOOO"
                                AndAfterDelay:3
                                      AndBack:^{
                                          [[FTT_HudTool share_FTT_HudTool]CreateHUD:LOCALIZATION(@"清理成功") 
                                                                            AndView:self.view           AndMode:MBProgressHUDModeText
                                                                           AndImage:@"NONO"
                                                                      AndAfterDelay:1
                                                                            AndBack:nil];
                                      }];
}



- (IBAction)logout:(id)sender {
    Eliminate(@"user")
    Eliminate(@"userId")
    [[TabBarTool Share_TabBarTool]CreateLoginC:self];
}


@end
