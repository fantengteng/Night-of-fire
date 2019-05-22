//
//  HZY_XiaoxiDetailC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/15.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_XiaoxiDetailC.h"
#import "MagicMoveAnimator.h"
#import "HZY_XiaoxiC.h"
#import "PercentDrivenTransition.h"
@interface HZY_XiaoxiDetailC ()
@property (nonatomic , strong) PercentDrivenTransition *percent;
@property (nonatomic , strong) UIScrollView *SV;

@end

@implementation HZY_XiaoxiDetailC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Is_hideJuhuazhuan = NO;
    self.view.backgroundColor = Col_FFF;
    _percent = [PercentDrivenTransition initWithScreenEdgeGestureForController:self];
}

- (void)tt_addSubviews {
  
    [self.view addSubview:self.SV];
    [self.view addSubview:self.Header_IMG];
    [self.SV addSubview:self.title_LAB];
    [self.SV addSubview:self.message_LAB];
    
    [self.Header_IMG setImageWithURL:[NSURL URLWithString:self.model.msgImg]
                  placeholder:nil
                      options:YYWebImageOptionProgressive
                      manager:[Create_Tool ImageManager]
                     progress:nil
                    transform:nil
                   completion:nil];
    IPhoneXHeigh
    self.Header_IMG.frame = CGRectMake(20, securitytop_Y, KScreenWidth - 40, KScreenWidth -40);
    
    self.title_LAB.sd_layout
    .leftSpaceToView(self.SV, 20)
    .rightSpaceToView(self.SV, 20)
    .topSpaceToView(self.SV, 10);
    
    self.message_LAB.sd_layout
    .leftEqualToView(self.title_LAB)
    .rightEqualToView(self.title_LAB)
    .topSpaceToView(self.title_LAB, 10);
    
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:self.model.title];
    content.lineSpacing = 5;
    content.color       = Col_333;
    content.font        = [UIFont boldSystemFontOfSize:18];
    CGSize maxsize = CGSizeMake(KScreenWidth - 40, MAXFLOAT);
    YYTextLayout *layout1 = [YYTextLayout layoutWithContainerSize:maxsize text:content];
    self.title_LAB.sd_layout
    .heightIs(layout1.textBoundingSize.height);
    self.title_LAB.attributedText = content;
    
    NSMutableAttributedString *content1 = [[NSMutableAttributedString alloc]initWithString:self.model.content];
    content1.lineSpacing = 5;
    content1.color       = Col_333;
    content1.font        = [UIFont boldSystemFontOfSize:18];
    YYTextLayout *layout2 = [YYTextLayout layoutWithContainerSize:maxsize text:content1];
    self.title_LAB.sd_layout
    .heightIs(layout2.textBoundingSize.height);
    self.message_LAB.attributedText = content1;
    
    self.SV.contentSize = CGSizeMake(0, 10 + layout1.textBoundingSize.height + 10 + layout2.textBoundingSize.height);
}




- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[HZY_XiaoxiC class]] && operation == UINavigationControllerOperationPop) {
        MagicMoveAnimator *transition = [MagicMoveAnimator initWithType:AnimationTypePop];
        return transition;
    }else{
        return nil;
    }
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    if ([animationController isKindOfClass:[MagicMoveAnimator class]]) {
        //手势开始的时候才需要传入手势过渡代理，如果直接点击pop，应该传入空，否者无法通过点击正常pop
        return _percent.isStart ? _percent : nil;
    }else{
        return nil;
    }
}


- (UIScrollView *)SV {
    if (!_SV) {
        IPhoneXHeigh
        _SV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, KScreenWidth - 40 + securitytop_Y, KScreenWidth, security_H - KScreenWidth - 40)];
        _SV.showsHorizontalScrollIndicator = NO;
        _SV.showsVerticalScrollIndicator = NO;
    }
    return _SV;
}


- (UIImageView *)Header_IMG {
    if (!_Header_IMG) {
        _Header_IMG = [TT_ControlTool FTT_ControlToolUIImageViewFrame:CGRectMake(20, 20, KScreenWidth - 40, KScreenWidth -40)
                                                            ImageName:@"NONO"
                                               userInteractionEnabled:NO
                                                        MasksToBounds:NO
                                                        ConrenrRadius:0
                                                          BorderColor:nil
                                                          BorderWidth:0
                                                           LabelBlock:nil];
    }
    return _Header_IMG;
}

- (UILabel *)title_LAB {
    if (!_title_LAB) {
        _title_LAB = [[UILabel alloc]init];
        _title_LAB.numberOfLines = 0;
    }
    return _title_LAB;
}

- (UILabel *)message_LAB {
    if (!_message_LAB) {
        _message_LAB = [[UILabel alloc]init];
        _message_LAB.numberOfLines = 0;
    }
    return _message_LAB;
}
@end
