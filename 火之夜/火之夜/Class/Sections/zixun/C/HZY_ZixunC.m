//
//  HZY_ZixunC.m
//  火之夜
//
//  Created by linlin dang on 2019/4/29.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_ZixunC.h"
#import "HZY_ZixunTableV.h"
#import "CurrenC.h"
#import "HZY_zixunModel.h"
#import "HZY_FabuC.h"
@interface HZY_ZixunC ()
@property (nonatomic , strong) HZY_ZixunTableV *TableV;
@end

@implementation HZY_ZixunC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    
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

- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(HZY_zixunModel *)model {
    [self jumpDetailC:model.url];
}

#pragma mark 界面跳转

- (void)jumpDetailC:(NSString *)url{
    CurrenC *CC = [[CurrenC alloc]init];
    CC.web_url = url;
    [self.navigationController pushViewController:CC animated:YES];
}

#pragma mark 触发方法

#pragma mark 公开方法

- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"资讯");
}

- (void)tt_addSubviews {
    IPhoneXHeigh
 
    [self setupTableV:[HZY_ZixunTableV class]Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H - 49)];
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@(self.TableV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:getNewsMARK params:dic networkClass:[HomeAPI class]];
}

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.TableV.is_refreshfoot = YES;
    self.TableV.is_refreshHeader = YES;
}


#pragma mark 存取方法

@end
