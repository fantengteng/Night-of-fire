//
//  HZY_HongbaoC.h
//  火之夜
//
//  Created by linlin dang on 2019/5/16.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseC.h"

@protocol HZY_HngbaoCDelegate <NSObject>

- (void)tap_money:(NSString *)moeney;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HZY_HongbaoC : TT_BaseC
@property (nonatomic , assign) NSInteger type;
@property (nonatomic , weak) id<HZY_HngbaoCDelegate> HB_Delegate;
@end

NS_ASSUME_NONNULL_END
