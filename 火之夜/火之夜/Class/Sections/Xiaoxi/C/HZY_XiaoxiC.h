//
//  HZY_XiaoxiC.h
//  火之夜
//
//  Created by linlin dang on 2019/4/29.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseC.h"
#import "HZY_xiaoxiTableV.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZY_XiaoxiC : TT_BaseC
@property (nonatomic , strong) HZY_xiaoxiTableV *TableV;
@property (nonatomic,strong) NSIndexPath *selectIndexPath;
@property (nonatomic,assign) CGRect finalCellRect;
@end

NS_ASSUME_NONNULL_END
