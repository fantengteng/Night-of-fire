//
//  HZY_MyfabuCell.h
//  火之夜
//
//  Created by linlin dang on 2019/5/1.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "TT_BaseCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HZY_MyfabuCell : TT_BaseCollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *header_IMG;
@property (weak, nonatomic) IBOutlet UILabel *title_LAB;
@property (weak, nonatomic) IBOutlet UILabel *price_LAB;

@end

NS_ASSUME_NONNULL_END
