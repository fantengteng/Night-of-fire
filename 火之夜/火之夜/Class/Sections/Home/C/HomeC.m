//
//  HomeC.m
//  番茄社区
//
//  Created by linlin dang on 2019/4/25.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeC.h"
#import "HZY_HomeTabelV.h"
#import "HZY_XinxianC.h"
#import "HZY_RemenC.h"
#import "HZY_ProducDetailC.h"
#import "HZY_FabuC.h"
@interface HomeC ()
@property (nonatomic , strong) HZY_HomeTabelV *TableV;
@property (nonatomic , strong) HZY_RemenC *RC;
@property (nonatomic , strong) HZY_XinxianC *XXC;
@property (nonatomic , strong) PZ_EditChildC *EC;
@property (nonatomic , assign) BOOL canScroll;
@property (nonatomic , assign) NSInteger tag;

@end

@implementation HomeC


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

- (void)scrollviewoffsetY:(CGFloat)CY {
    IPhoneXHeigh
    CGFloat nodeH = 147;
    if (!self.canScroll) {
        self.TableV.contentOffset = CGPointMake(0, nodeH);
        self.XXC.mainCanscroll = NO;
        self.RC.mainCanscroll = NO;
    }else if (CY > nodeH) {
        self.XXC.mainCanscroll = NO;
        self.XXC.childcanScroll = YES;
        self.RC.mainCanscroll = NO;
        self.RC.childcanScroll = YES;
        self.canScroll = NO;
        self.TableV.contentOffset = CGPointMake(0, nodeH);
    }else if (CY <= nodeH && CY > 0) {
        self.XXC.mainCanscroll = YES;
        self.RC.mainCanscroll = YES;
    }else if (CY <= 0) {
    
        self.XXC.mainCanscroll = NO;
        self.RC.mainCanscroll = NO;
        self.TableV.contentOffset = CGPointMake(0, 0);
    }
}

- (void)tt_allClose {
    @weakify(self)
    self.TableV.tapClose = ^(NSInteger num, id data) {
        @strongify(self)
        self.tag = num;
    };
    
    self.XXC.ScrollViewContent_Block = ^{
        @strongify(self)
        self.canScroll = YES;
    };
    
    self.XXC.Currey = ^(id  _Nonnull model) {
        @strongify(self)
        [self jumpProducDetailC:model];
   
    };
    
    self.RC.ScrollViewContent_Block = ^{
        @strongify(self)
        self.canScroll = YES;
    };
    
    self.RC.Currey = ^(id  _Nonnull model) {
        @strongify(self)
        [self jumpProducDetailC:model];
    };
}

#pragma mark 界面跳转

- (void)jumpProducDetailC:(id)model {
  
    HZY_ProducDetailC *DC = [[HZY_ProducDetailC alloc]init];
    DC.Model = model;
    [self.navigationController pushViewController:DC animated:YES] ;
}

#pragma mark 触发方法

#pragma mark 公开方法

- (void)tt_addSubviews {
    [self setupTableV:[HZY_HomeTabelV class]];
    self.XXC = [[HZY_XinxianC alloc]init];
    self.RC = [[HZY_RemenC alloc]init];
    [self.TableV initWithTabBarControllers:@[self.XXC,self.RC] childTitles:@[LOCALIZATION(@"XX"),LOCALIZATION(@"RM")]];
    [self tt_allClose];
}

- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"首页");
}

- (void)configData {
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [self configDataforNewnetWorkname:lunboBannerMarK params:dic networkClass:[HomeAPI class]];
}

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.canScroll = YES;
    self.Is_hideJuhuazhuan = NO;
    [self wr_setNavBarShadowImageHidden:NO];
}

#pragma mark 存取方法

@end
