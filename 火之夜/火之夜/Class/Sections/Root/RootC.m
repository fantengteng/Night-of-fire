//
//  RootC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "RootC.h"

@interface RootC ()

@end

@implementation RootC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self wr_setNavBarShadowImageHidden:YES];
    [self jumpTT];
}
#pragma mark 回调协议

#pragma mark 界面跳转

- (void)JumpTabbar {
    [[TabBarTool Share_TabBarTool]CreateTabBar];
}

- (void)jumpLogin {
    [[TabBarTool Share_TabBarTool]CreateLoginC];
}


#pragma mark 触发方法

- (void)jumpTT {
    [FTT_Helper CreateTitle:@"提示"
                    message:@"登录还是首页"
               CantionTitle:@"登录"
                       Sure:@"首页" preferredStyle:UIAlertControllerStyleAlert
                     SureAC:^{
                         [self JumpTabbar];
                     } NoAC:^{
                         [self jumpLogin];
                     } ViewController:self];
}


#pragma mark 公开方法

#pragma mark 私有方法

#pragma mark 存取方法

@end
