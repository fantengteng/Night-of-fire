//
//  HZY_hongbaoV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/16.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_hongbaoV.h"

@interface HZY_hongbaoV ()
@property (nonatomic , strong) YYLabel *message;
@property (nonatomic , strong) UIButton *btn;
@end

@implementation HZY_hongbaoV


- (void)tap_method {
    if (self.ViewtapClose) {
        self.ViewtapClose(0, @"");
    }
}

- (void)configprice:(NSString *)price {
    self.message.text = LOCALIZATION(@"红包");
    [self.btn setTitle:price forState:UIControlStateNormal];
    
}

#pragma mark 私有方法

- (void)tt_setupViews {
    self.backgroundColor = Col_FFF;
    [self addSubview:self.message];
    [self addSubview:self.btn];
    
    self.message.sd_layout
    .leftSpaceToView(self, 20)
    .widthIs(100)
    .topEqualToView(self)
    .bottomEqualToView(self);
    
    self.btn.sd_layout
    .rightSpaceToView(self, 20)
    .topEqualToView(self)
    .leftSpaceToView(self.message, 10)
    .heightIs(50);
    
 
}

#pragma mark 存取方法


- (YYLabel *)message {
    if (!_message) {
        _message = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont boldSystemFontOfSize:16]];
        _message.text =LOCALIZATION(@"红包");
    }
    return _message;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectZero
                                                     taeget:self
                                                        sel:@selector(tap_method)
                                                        tag:0
                                                   AntTitle:LOCALIZATION(@"暂无可用红包") 
                                                  titleFont:16
                                                 titleColor:Col_D81
                                                   andImage:@"NONONO"
                                               AndBackColor:Col_FFF
                                    adjustsFontSizesTowidth:NO
                                              masksToBounds:NO
                                               conrenRadius:0
                                                BorderColor:nil
                                                BorderWidth:0
                                  ContentHorizontalAligment:2];
    }
    return _btn;
}
@end

