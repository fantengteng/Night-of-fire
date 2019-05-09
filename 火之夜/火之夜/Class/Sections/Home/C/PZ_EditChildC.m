//
//  PZ_EditChildC.m
//  破竹
//
//  Created by linlin dang on 2019/1/23.
//  Copyright © 2019年 米宅. All rights reserved.
//

#import "PZ_EditChildC.h"
@interface PZ_EditChildC ()

@end

@implementation PZ_EditChildC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainCanscroll = NO;
}

#pragma mark 回调协议

- (void)scrollviewoffsetY:(CGFloat)Y {
    if (!self.childcanScroll) {
        if (!(!self.mainCanscroll && Y < 0)) {
            self.TableV.contentOffset = CGPointMake(0, 0);
        }
    }else if (Y <= 0) {
        self.childcanScroll = NO;
        if (self.ScrollViewContent_Block) {
            self.ScrollViewContent_Block();
        }
    }
}

- (void)scrollviewSlideupandDown:(BOOL)YorN scrollview:(UIScrollView *)scrollview {
    if (self.ScrollviewUporDownBlock) {
        self.ScrollviewUporDownBlock(YorN);
    }
}

#pragma mark 界面跳转

#pragma mark 触发方法

#pragma mark 公开方法

#pragma mark 私有方法

#pragma mark 存取方法

- (void)setChildcanScroll:(BOOL)childcanScroll {
    _childcanScroll = childcanScroll;
    
}
@end
