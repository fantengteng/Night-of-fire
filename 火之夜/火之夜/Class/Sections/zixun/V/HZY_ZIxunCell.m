//
//  HZY_ZIxunCell.m
//  火之夜
//
//  Created by linlin dang on 2019/5/1.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_ZIxunCell.h"
#import "HZY_zixunModel.h"
@implementation HZY_ZIxunCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle =  UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configData:(HZY_zixunModel *)Data {
    self.name_LAB.text = Data.title;
    self.time_LAB.text = Data.createtime;
    [self.header_IMG setImageWithURL:[NSURL URLWithString:Data.imgurl]
                        placeholder:nil
                            options:YYWebImageOptionProgressive
                            manager:[Create_Tool ImageManager]
                           progress:nil
                          transform:nil
                         completion:nil];
    
    
}

@end
