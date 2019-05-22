//
//  HZY_XiaoxiC.m
//  火之夜
//
//  Created by linlin dang on 2019/4/29.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_XiaoxiC.h"

#import "HZY_XiaoxiDetailC.h"
#import "HZY_FabuC.h"
#import "MagicMoveAnimator.h"
@interface HZY_XiaoxiC ()<UINavigationControllerDelegate>

@end

@implementation HZY_XiaoxiC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
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

#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[HZY_XiaoxiDetailC class]] && operation == UINavigationControllerOperationPush) {
        MagicMoveAnimator *transition = [MagicMoveAnimator initWithType:AnimationTypePush];
        return transition;
    }else{
        return nil;
    }
}


- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(id)model {
    HZY_XiaoxiDetailC *DC = [[HZY_XiaoxiDetailC alloc]init];
    DC.model = model;
    [self.navigationController pushViewController:DC animated:YES];
}

#pragma mark 界面跳转

#pragma mark 触发方法

#pragma mark 公开方法

- (void)configureViewFromLocalisation {
    self.title = LOCALIZATION(@"消息");
}

- (void)tt_addSubviews {
    IPhoneXHeigh
    [self setupTableV:[HZY_xiaoxiTableV class]Frame:CGRectMake(0, securitytop_Y, KScreenWidth, security_H - 49)];
    [self setupVM:[HomeVM class]];
}

- (void)configData {
    [self configDataforNewnetWorkname:msgListMARK params:[NSMutableDictionary new] networkClass:[HomeAPI class]];
}

#pragma mark 私有方法



#pragma mark 存取方法

@end
