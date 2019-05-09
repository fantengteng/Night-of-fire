//
//  HZY_MyaddressCell.h
//  火之夜
//
//  Created by linlin dang on 2019/5/6.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseCell.h"
#import "HZY_MyaddressModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZY_MyaddressCell : TT_BaseCell
@property (nonatomic , strong) UILabel *name_lab;
@property (nonatomic , strong) UILabel *phone_lab;
@property (nonatomic , strong) UILabel *message_lab;
@property (nonatomic , strong) UIButton *delete_btn;
@property (nonatomic , strong) UIButton *bianji_btn;
@property (nonatomic , strong) UILabel *line;
@property (nonatomic , strong) UIView *BG;
@property (nonatomic , strong) TT_Custonbtn *setAddress_btn;
@property (nonatomic , strong) HZY_MyaddressModel *model;
@end

NS_ASSUME_NONNULL_END
