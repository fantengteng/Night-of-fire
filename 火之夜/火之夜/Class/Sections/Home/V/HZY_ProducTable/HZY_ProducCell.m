//
//  HZY_ProducCell.m
//  火之夜
//
//  Created by linlin dang on 2019/5/7.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_ProducCell.h"
#import "CurreryinfoV.h"
#import "CurreryImagSV.h"

@interface HZY_ProducCell ()


@property (nonatomic , strong) CurreryinfoV *headerInfo;

@property (nonatomic , strong) CurreryImagSV *ImagesV;

@property (nonatomic , strong) YYLabel *message_LAB;


@end
@implementation HZY_ProducCell


#pragma mark 生命周期

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
#pragma mark 回调协议

#pragma mark 触发方法

#pragma mark 公开方法

- (void)configData:(HZY_ProductInfoModel *)Data {
    
    [self.headerInfo configheaderImageName:@"" nameStr:Data.nickeName timeStr:@""];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:Data.discription];
    content.lineSpacing = 5;
    content.color       = Col_666;
    content.font        = [UIFont systemFontOfSize:12];
    self.message_LAB.attributedText = content;
    CGSize maxsize = CGSizeMake(KScreenWidth - 30, MAXFLOAT);
    YYTextLayout *layout1 = [YYTextLayout layoutWithContainerSize:maxsize text:content];
    self.message_LAB.sd_layout
    .heightIs(layout1.textBoundingSize.height);
    self.message_LAB.attributedText = content;
    
    if (content) {
        NSMutableArray *IMS = [NSMutableArray new];
        [IMS addObject:Data.headimg];
        [self.ImagesV configImageS:IMS type:0];
    }
    
    self.ImagesV.sd_layout
    .topSpaceToView(self.message_LAB, 0)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(self.ImagesV.H);
    
    [self setupAutoHeightWithBottomView:self.ImagesV bottomMargin:20];
    
}

#pragma mark 私有方法

- (void)setupSubviewS {
    [self.contentView addSubview:self.headerInfo];
    [self.contentView addSubview:self.message_LAB];
    [self.contentView addSubview:self.ImagesV];
    [self setupSubViewsFrame];
}

- (void)setupSubViewsFrame {
    
    self.headerInfo.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .topSpaceToView(self.contentView, 22)
    .heightIs(45);
    
    self.message_LAB.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .topSpaceToView(self.headerInfo, 25);
    
}

#pragma mark 存取方法
- (void)setModel:(HZY_ProductInfoModel *)model {
    _model = model;
    [self configData:model];
}

- (YYLabel *)message_LAB {
    if (!_message_LAB) {
        _message_LAB = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont systemFontOfSize:12]];
    }
    return _message_LAB;
}


- (CurreryinfoV *)headerInfo {
    if (!_headerInfo) {
        _headerInfo = [[CurreryinfoV alloc]init];
    }
    return _headerInfo;
}

- (CurreryImagSV *)ImagesV {
    if (!_ImagesV) {
        _ImagesV = [[CurreryImagSV alloc]init];
    }
    return _ImagesV;
}




@end
