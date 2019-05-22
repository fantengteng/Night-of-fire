//
//  HZY_MyfabuCell.m
//  火之夜
//
//  Created by linlin dang on 2019/5/1.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_MyfabuCell.h"
#import "HZY_ProductInfoModel.h"
@implementation HZY_MyfabuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 4;
    self.backgroundColor = Col_FFF;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    
        self = [[NSBundle mainBundle]loadNibNamed:@"HZY_MyfabuCell" owner:self options:nil].lastObject;
        
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
 
    self.title_LAB.text = Data.title;
    self.price_LAB.text =  [NSString stringWithFormat:@"¥%ld", Data.price];
}


- (void)setData:(id)Data {
    [self configforData:Data];
}
@end
