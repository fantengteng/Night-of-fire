//
//  PZ_EditChildC.h
//  破竹
//
//  Created by linlin dang on 2019/1/23.
//  Copyright © 2019年 米宅. All rights reserved.
//

#import "TT_BaseC.h"

@interface PZ_EditChildC : TT_BaseC<UIScrollViewDelegate>
/// 是否可以滚动
@property (nonatomic , assign) BOOL childcanScroll;
/// 主视图现在是否可以滚动
@property (nonatomic , assign) BOOL mainCanscroll;
/** 是否滑动 */
@property (nonatomic , assign) BOOL canContentScroll;
/** 滑动回调 */
@property (nonatomic , copy) void(^ScrollViewContent_Block)(void);

@property (nonatomic , copy) void(^ScrollviewUporDownBlock)(BOOL YorN);

@end
