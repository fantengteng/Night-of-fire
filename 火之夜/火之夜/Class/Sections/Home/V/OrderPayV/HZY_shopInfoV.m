//
//  HZY_shopInfoV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/13.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_shopInfoV.h"

@interface HZY_shopInfoV ()
@property (nonatomic , strong) UIImageView *header_ING;
@property (nonatomic , strong) YYLabel *title_LAB;
@property (nonatomic , strong) YYLabel *price_LAB;
@end

@implementation HZY_shopInfoV

#pragma mark 生命周期

#pragma mark 回调协议

#pragma mark 触发方法

#pragma mark 公开方法

- (void)configURl:(NSString *)url title:(NSString *)title price:(NSString *)price {
    [self.header_ING setImageWithURL:[NSURL URLWithString:url]
                     placeholder:nil
                         options:YYWebImageOptionProgressive
                         manager:[Create_Tool ImageManager]
                        progress:nil
                       transform:nil
                          completion:nil];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:title];
    content.lineSpacing = 5;
    content.color       = Col_333;
    content.font        = [UIFont boldSystemFontOfSize:18];
    CGSize maxsize = CGSizeMake(KScreenWidth - 160, MAXFLOAT);
    YYTextLayout *layout1 = [YYTextLayout layoutWithContainerSize:maxsize text:content];
    self.title_LAB.sd_layout
    .heightIs(layout1.textBoundingSize.height);
    self.title_LAB.attributedText = content;
    self.price_LAB.text = price;
}

#pragma mark 私有方法

- (void)tt_setupViews {
    self.backgroundColor = Col_FFF;
    [self addSubview:self.header_ING];
    [self addSubview:self.title_LAB];
    [self addSubview:self.price_LAB];
    [self tt_setupViewsFrame];
}

- (void)tt_setupViewsFrame {
    self.header_ING.sd_layout
    .leftSpaceToView(self, 5)
    .topSpaceToView(self, 5)
    .widthIs(150)
    .heightIs(150);
    
    self.title_LAB.sd_layout
    .rightSpaceToView(self, 5)
    .leftSpaceToView(self.header_ING, 20)
    .topSpaceToView(self, 5);
    
    self.price_LAB.sd_layout
    .leftEqualToView(self.title_LAB)
    .rightEqualToView(self.title_LAB)
    .bottomSpaceToView(self, 10)
    .heightIs(30);
}

#pragma mark 存取方法

- (UIImageView *)header_ING {
    if (!_header_ING) {
        _header_ING = [[UIImageView alloc]init];
    }
    return _header_ING;
}

- (YYLabel *)title_LAB {
    if (!_title_LAB) {
        _title_LAB = [Create_Tool CreatLabeltextcolor:Col_333 textfont:[UIFont boldSystemFontOfSize:18]];
    }
    return _title_LAB;
}

- (YYLabel *)price_LAB {
    if (!_price_LAB) {
        _price_LAB = [Create_Tool CreatLabeltextcolor:Col_D81 textfont:[UIFont boldSystemFontOfSize:18]];
    }
    return _price_LAB;
}
@end

