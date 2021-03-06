//
//  HZY_XinRenCell.m
//  火之夜
//
//  Created by linlin dang on 2019/4/30.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_XinRenCell.h"

@implementation HZY_XinRenCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = Col_FFF;
    self.header_IMG.layer.masksToBounds = YES;
    self.layer.cornerRadius = 4;
}



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self = [[NSBundle mainBundle]loadNibNamed:@"HZY_XinRenCell" owner:self options:nil].lastObject;
        
    }
    return self;
    
}

- (void)configforData:(HZY_ProductInfoModel *)Data {
    [self.header_IMG setImageWithURL:[NSURL URLWithString:Data.headimg[0]]
                        placeholder:nil
                            options:YYWebImageOptionProgressive
                            manager:[Create_Tool ImageManager]
                           progress:nil
                           transform:nil
                         completion:nil];
    [self.IMG setImageWithURL:[NSURL URLWithString:Data.userImg]
                  placeholder:nil
                      options:YYWebImageOptionProgressive
                      manager:[Create_Tool ImageManager]
                     progress:nil
                    transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
                        return [image imageWithRadius:4 rectSize:CGSizeMake(30, 30)];
                    }
                   completion:nil];
    self.title_LAB.text = Data.title;
    self.Money.text =  [NSString stringWithFormat:@"¥%ld", Data.price];
    self.name_LAB.text = Data.nickeName;
    self.TIme_LAB.text = Data.createtime;
    
}
    
@end
