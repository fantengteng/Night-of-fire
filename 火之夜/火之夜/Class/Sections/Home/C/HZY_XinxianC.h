//
//  HZY_XinxianC.h
//  火之夜
//
//  Created by linlin dang on 2019/4/30.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseC.h"
#import "PZ_EditChildC.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZY_XinxianC : PZ_EditChildC
@property (nonatomic , copy) void(^Currey)(id model);
@property (nonatomic , copy) void(^loadSuccess)();
@end

NS_ASSUME_NONNULL_END
