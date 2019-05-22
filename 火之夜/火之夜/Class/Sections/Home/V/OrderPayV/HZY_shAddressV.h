//
//  HZY_shAddressV.h
//  火之夜
//
//  Created by linlin dang on 2019/5/13.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseV.h"
#import "HZY_MyaddressModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZY_shAddressV : TT_BaseV
@property (nonatomic , assign) NSInteger type;
- (void)configData:(HZY_MyaddressModel *)data istype:(NSInteger)type;
@end

NS_ASSUME_NONNULL_END
