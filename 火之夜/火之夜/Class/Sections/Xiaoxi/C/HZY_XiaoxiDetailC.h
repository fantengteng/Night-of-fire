//
//  HZY_XiaoxiDetailC.h
//  火之夜
//
//  Created by linlin dang on 2019/5/15.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseC.h"
#import "HZY_XiaoxiModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZY_XiaoxiDetailC : TT_BaseC<UINavigationControllerDelegate>
@property (nonatomic , strong) HZY_XiaoxiModel *model;
@property (nonatomic , strong) UIImageView *Header_IMG;
@property (nonatomic , strong) UILabel *title_LAB;
@property (nonatomic , strong) UILabel *message_LAB;
@end

NS_ASSUME_NONNULL_END
