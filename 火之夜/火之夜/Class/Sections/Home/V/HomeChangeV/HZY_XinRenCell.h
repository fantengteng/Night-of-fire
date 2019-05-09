//
//  HZY_XinRenCell.h
//  火之夜
//
//  Created by linlin dang on 2019/4/30.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseCollectionViewCell.h"
#import "HZY_ProductInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZY_XinRenCell : TT_BaseCollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *header_IMG;
@property (weak, nonatomic) IBOutlet UILabel *title_LAB;
@property (weak, nonatomic) IBOutlet UILabel *Money;
@property (weak, nonatomic) IBOutlet UIImageView *IMG;
@property (weak, nonatomic) IBOutlet UILabel *name_LAB;
@property (weak, nonatomic) IBOutlet UILabel *TIme_LAB;
@end

NS_ASSUME_NONNULL_END
