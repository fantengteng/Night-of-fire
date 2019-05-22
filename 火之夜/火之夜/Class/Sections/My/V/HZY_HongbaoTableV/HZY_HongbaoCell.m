//
//  HZY_HongbaoCell.m
//  火之夜
//
//  Created by linlin dang on 2019/5/16.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_HongbaoCell.h"

@implementation HZY_HongbaoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.IMG setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557226220596&di=6c7f3c612e225bb7fb32398b7a092685&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F17%2F11%2F21%2F4f7904d8adf2a50f8cd55cb65643fc78.jpg%2521%2Ffwfh%2F804x804%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue"]
                  placeholder:nil
                      options:YYWebImageOptionProgressive
                      manager:[Create_Tool ImageManager]
                     progress:nil
                    transform:nil
                   completion:nil];
    
    self.message_LAB.text = LOCALIZATION(@"无门槛消费（全场通用）");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
