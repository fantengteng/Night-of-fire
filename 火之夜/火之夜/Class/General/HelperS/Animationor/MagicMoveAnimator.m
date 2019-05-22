//
//  MagicMoveAnimator.m
//  KeyNoteVCTransition
//
//  Created by bjovov on 2017/9/26.
//  Copyright © 2017年 CaoXueLiang.cn. All rights reserved.
//

#import "MagicMoveAnimator.h"
#import "HZY_XiaoxiC.h"
#import "HZY_XiaoxiDetailC.h"
#import "HZY_XiaoxiCell.h"
@implementation MagicMoveAnimator
#pragma mark - Init Mednthod
+ (instancetype)initWithType:(AnimationType)type{
    MagicMoveAnimator *model = [[MagicMoveAnimator alloc]init];
    model.type = type;
    return model;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.6f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (self.type == AnimationTypePush) {
        [self PushAnimation:transitionContext];
    }else if(self.type == AnimationTypePop){
        [self PopAnimation:transitionContext];
    }
}

#pragma mark - Animation Menthod
- (void)PushAnimation:(id <UIViewControllerContextTransitioning>)transitionContext{
    /*切出和切入的VC*/
    HZY_XiaoxiC *fromVC = (HZY_XiaoxiC*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    HZY_XiaoxiDetailC *toVC = (HZY_XiaoxiDetailC*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    /*VC切换所发生的view容器，开发者应该将切出的view移除，将切入的view加入到该view容器中。*/
    UIView *containerView = [transitionContext containerView];
    
    /*对选中cell的imageView截图*/
    NSIndexPath *indexPath = [fromVC.TableV indexPathForSelectedRow];
    fromVC.selectIndexPath = indexPath;
    HZY_XiaoxiCell *selectCell = (HZY_XiaoxiCell*)[fromVC.TableV cellForRowAtIndexPath:indexPath];
    UIView *snapShotView = [selectCell.IMG snapshotViewAfterScreenUpdates:NO];
    
    // 将rect从view中转换到当前视图中，返回在当前视图中的rect
    snapShotView.frame = fromVC.finalCellRect = [containerView convertRect:selectCell.IMG.frame fromView:selectCell.IMG.superview];
    selectCell.IMG.hidden = YES;
    
    
    /*设置第二个控制器的位置，透明度*/
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.Header_IMG.hidden = YES;
    
    CGPoint currentCenter = toVC.title_LAB.center;
    toVC.title_LAB.center = CGPointMake(currentCenter.x + 30, currentCenter.y);
    
    /*将动画前后的两个View添加到containerView,注意添加顺序，snapShotView在上面*/
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];
    
    /*开始动画*/
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        //textView中心点
        toVC.title_LAB.center = currentCenter;
        //透明度，frame变换
        toVC.view.alpha = 1.0;
        snapShotView.frame = [containerView convertRect:toVC.Header_IMG.frame toView:toVC.Header_IMG.superview];
    } completion:^(BOOL finished) {
        toVC.Header_IMG.hidden = NO;
        selectCell.IMG.hidden = NO;
        [snapShotView removeFromSuperview];
        
        /*告诉系统动画结束*/
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (void)PopAnimation:(id <UIViewControllerContextTransitioning>)transitionContext{
    /*获取toVC和fromVC,动画容器*/
    HZY_XiaoxiDetailC *fromVC = (HZY_XiaoxiDetailC*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    HZY_XiaoxiC *toVC = (HZY_XiaoxiC*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    /*获取截图*/
    UIView *snapShotView = [fromVC.Header_IMG snapshotViewAfterScreenUpdates:NO];
    snapShotView.backgroundColor = [UIColor clearColor];
    snapShotView.frame = [containerView convertRect:fromVC.Header_IMG.frame fromView:fromVC.Header_IMG.superview];
    fromVC.Header_IMG.hidden = YES;
    
    /*获取图片终点的frame*/
    HZY_XiaoxiCell *cell = (HZY_XiaoxiCell *)[toVC.TableV cellForRowAtIndexPath:toVC.selectIndexPath];
    cell.IMG.hidden = YES;
    
    //添加视图到containerView,层级关系很重要
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView addSubview:snapShotView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        fromVC.view.alpha = 0;
        snapShotView.frame = toVC.finalCellRect;
        
    } completion:^(BOOL finished) {
        
        [snapShotView removeFromSuperview];
        fromVC.Header_IMG.hidden = NO;
        cell.IMG.hidden = NO;
        //完成动画
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
