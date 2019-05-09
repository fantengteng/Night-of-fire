//
//  HZY_HomeTabelV.h
//  火之夜
//
//  Created by linlin dang on 2019/4/30.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseTableV.h"

NS_ASSUME_NONNULL_BEGIN

@interface HZY_HomeTabelV : TT_BaseTableV
- (void)initWithTabBarControllers:(NSArray<UIViewController *> *)controllers childTitles:(NSArray *)childTitles;
@end

NS_ASSUME_NONNULL_END
