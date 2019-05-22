//
//  HZY_shAddressV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/13.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_shAddressV.h"
#import "HZY_MyaddressModel.h"
@interface HZY_shAddressV ()

@property (nonatomic , strong) YYLabel *addreeSTR;

@property (nonatomic , strong) YYLabel *name_LAB;

@property (nonatomic , strong) YYLabel *Addres_LAB;

@property (nonatomic , strong) YYLabel *xiangqing_LAB;

@property (nonatomic , strong) YYLabel *yunfei_LAB;

@property (nonatomic , strong) YYLabel *price_LAB;

@property (nonatomic , strong) UIView *lineV;

@property (nonatomic , strong) UIImageView *jiantou;




@end

@implementation HZY_shAddressV

#pragma mark 生命周期

#pragma mark 回调协议

#pragma mark 触发方法

- (void)tap_V {
    if (self.ViewtapClose) {
        self.ViewtapClose(self.type, @"");
    }
}

#pragma mark 公开方法

- (void)configData:(HZY_MyaddressModel *)data istype:(NSInteger)type {
    self.type = type;
    if (type == 1) {
        [self.xiangqing_LAB removeFromSuperview];
        self.name_LAB.text = [NSString stringWithFormat:@"%@  %@",data.name,data.mobile];
        self.Addres_LAB.text = data.address;
    }else {
        [self addSubview:self.xiangqing_LAB];
        self.xiangqing_LAB.sd_layout
        .leftSpaceToView(self.addreeSTR, 10)
        .rightSpaceToView(self, 40)
        .topEqualToView(self)
        .heightIs(120);
        [self.name_LAB removeFromSuperview];
        [self.Addres_LAB removeFromSuperview];
        self.xiangqing_LAB.text = LOCALIZATION(@"请添加新地址") ;
        self.xiangqing_LAB.textAlignment = NSTextAlignmentRight;
    }

}

#pragma mark 私有方法

- (void)tt_setupViews {
    self.backgroundColor = Col_FFF;
    [self addSubview:self.addreeSTR];
    [self addSubview:self.name_LAB];
    [self addSubview:self.Addres_LAB];
    [self addSubview:self.jiantou];
    [self addSubview:self.lineV];
    [self addSubview:self.yunfei_LAB];
    [self addSubview:self.price_LAB];
    [self tt_setupViewsFrame];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_V)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}


- (void)tt_setupViewsFrame {
    
    self.addreeSTR.sd_layout
    .leftSpaceToView(self, 20)
    .widthIs(100)
    .topSpaceToView(self, 0)
    .bottomSpaceToView(self, 50);
    
    self.name_LAB.sd_layout
    .rightSpaceToView(self, 40)
    .topSpaceToView(self, 40)
    .leftSpaceToView(self.addreeSTR, 5)
    .heightIs(20);
    
    self.Addres_LAB.sd_layout
    .leftEqualToView(self.name_LAB)
    .rightEqualToView(self.name_LAB)
    .topSpaceToView(self.name_LAB, 0)
    .heightIs(20);
    
    self.jiantou.sd_layout
    .rightSpaceToView(self, 10)
    .topSpaceToView(self, 50)
    .widthIs(18)
    .heightIs(18);
    
    self.lineV.sd_layout
    .leftSpaceToView(self, 20)
    .rightSpaceToView(self, 20)
    .topSpaceToView(self, 120)
    .heightIs(1);
    
    self.yunfei_LAB.sd_layout
    .leftEqualToView(self.addreeSTR)
    .widthIs(100)
    .heightIs(50)
    .topSpaceToView(self.lineV, 0);
    
    self.price_LAB.sd_layout
    .rightSpaceToView(self, 20)
    .topSpaceToView(self.lineV, 0)
    .leftSpaceToView(self.yunfei_LAB, 0)
    .heightIs(50);
    
    
}
#pragma mark 存取方法


- (UIView *)lineV {
    if (!_lineV) {
        _lineV = [TT_ControlTool FTT_ControlToolUIViewFrame:CGRectZero BackgroundColor:Col_ECE MasksToBounds:NO ConrenrRadius:0];
    }
    return _lineV;
}


- (UIImageView *)jiantou {
    if (!_jiantou) {
        _jiantou = [[UIImageView alloc]init];
        _jiantou.image = [UIImage imageNamed:@"jiantou"];
    }
    return _jiantou;
}

- (YYLabel *)addreeSTR {
    if (!_addreeSTR) {
        _addreeSTR = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont boldSystemFontOfSize:16]];
        _addreeSTR.text = LOCALIZATION(@"收货地址") ;
    }
    return _addreeSTR;
}

- (YYLabel *)name_LAB {
    if (!_name_LAB) {
        _name_LAB = [Create_Tool CreatLabeltextcolor:Col_999 textfont:[UIFont systemFontOfSize:14]];
        _name_LAB.textAlignment =NSTextAlignmentRight;
    }
    return _name_LAB;
}

- (YYLabel *)Addres_LAB {
    if (!_Addres_LAB) {
        _Addres_LAB = [Create_Tool CreatLabeltextcolor:Col_999 textfont:[UIFont systemFontOfSize:14]];
        _Addres_LAB.textAlignment = NSTextAlignmentRight;
    }
    return _Addres_LAB;
}

- (YYLabel *)xiangqing_LAB {
    if (!_xiangqing_LAB) {
        _xiangqing_LAB = [Create_Tool CreatLabeltextcolor:Col_D81 textfont:[UIFont boldSystemFontOfSize:16]];
        _xiangqing_LAB.textAlignment = NSTextAlignmentRight;
    }
    return _xiangqing_LAB;
}

- (YYLabel *)yunfei_LAB {
    if (!_yunfei_LAB) {
        _yunfei_LAB = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont boldSystemFontOfSize:16]];
        _yunfei_LAB.text = LOCALIZATION(@"运费") ;
    }
    return _yunfei_LAB;
}


- (YYLabel *)price_LAB {
    if (!_price_LAB) {
        _price_LAB = [Create_Tool CreatLabeltextcolor:Col_D81 textfont:[UIFont boldSystemFontOfSize:16]];
        _price_LAB.text = @"¥0";
        _price_LAB.textAlignment = NSTextAlignmentRight;
    }
    return _price_LAB;
}



@end
