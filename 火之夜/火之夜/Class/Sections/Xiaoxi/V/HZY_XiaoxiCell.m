//
//  HZY_XiaoxiCell.m
//  火之夜
//
//  Created by linlin dang on 2019/4/30.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_XiaoxiCell.h"
#import "HZY_XiaoxiModel.h"
@implementation HZY_XiaoxiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle =  UITableViewCellSelectionStyleNone;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}


- (void)configData:(HZY_XiaoxiModel *)Data {
    self.Name_Lab.text = Data.title;
    self.title_Lab.text = Data.createtime;
    [self.IMG setImageWithURL:[NSURL URLWithString:Data.msgImg]
                         placeholder:nil
                             options:YYWebImageOptionProgressive
                             manager:[Create_Tool ImageManager]
                            progress:nil
                           transform:nil
                          completion:nil];
}

@end
