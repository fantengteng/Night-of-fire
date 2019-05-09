//
//  HZY_RemenC.m
//  火之夜
//
//  Created by linlin dang on 2019/4/30.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_RemenC.h"
#import "HZY_XinxianCollectionV.h"
#import "HZY_ProducDetailC.h"
@interface HZY_RemenC ()
@property (nonatomic , strong) HZY_XinxianCollectionV *CollectionV;
@end

@implementation HZY_RemenC


#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
}
#pragma mark 回调协议

- (void)scrollviewoffsetY:(CGFloat)Y {
    if (!self.childcanScroll) {
        if (!self.mainCanscroll && Y < 0) {
            self.CollectionV.contentOffset = CGPointMake(0, 0);
        }
    }else if (Y <= 0) {
        self.childcanScroll = NO;
        if (self.ScrollViewContent_Block) {
            self.ScrollViewContent_Block();
        }
    }
}

- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(id)model {
    [self jumpProducDetailC:model];
}

#pragma mark 界面跳转

- (void)jumpProducDetailC:(id)model {
    if (self.Currey) {
        self.Currey(model);
    }
}

#pragma mark 触发方法

#pragma mark 公开方法

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupCollectionV:[HZY_XinxianCollectionV class] Frame:CGRectMake(0, 0, KScreenWidth, security_H - 44 - 49)];
}

- (void)configData {
    USER_ID
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:@"2" forKey:@"type"];
    [dic setValue:usee_id forKey:@"memberId"];
    [dic setValue:@(self.CollectionV.Page) forKey:@"page"];
    [self configDataforNewnetWorkname:getProductInfoMARK params:dic networkClass:[HomeAPI class]];
}


#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.CollectionV.is_refreshfoot = YES;
    [self wr_setNavBarShadowImageHidden:NO];
}

#pragma mark 存取方法



@end
