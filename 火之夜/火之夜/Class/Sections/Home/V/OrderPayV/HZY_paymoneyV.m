//
//  HZY_paymoneyV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/13.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_paymoneyV.h"

@interface HZY_paymoneyV ()
@property (nonatomic , strong) YYLabel *message;
@property (nonatomic , strong) UIButton *btn;
@end

@implementation HZY_paymoneyV

#pragma mark 生命周期

#pragma mark 回调协议

#pragma mark 触发方法

- (void)tap_method {
    if (self.ViewtapClose) {
        self.ViewtapClose(0, @"");
    }
}

#pragma mark 公开方法

- (void)configprice:(NSInteger)price {
    NSString *p = [NSString stringWithFormat:@" ¥%ld",price];
    NSString *T = LOCALIZATION(@"实付款");
    NSString *ST = [NSString stringWithFormat:@"%@:%@",T,p];
    NSMutableAttributedString *STr = [[NSMutableAttributedString alloc]initWithString:ST];
   
    [STr setFont:[UIFont boldSystemFontOfSize:18]];
   
    [STr setColor:Col_333 range:NSMakeRange(0, T.length + 1)];
    [STr setColor:Col_D81 range:NSMakeRange(T.length + 1, p.length)];
    self.message.attributedText = STr;
    
}

#pragma mark 私有方法

- (void)tt_setupViews {
    self.backgroundColor = Col_FFF;
    [self addSubview:self.message];
    [self addSubview:self.btn];
    
    self.btn.sd_layout
    .rightSpaceToView(self, 0)
    .topEqualToView(self)
    .widthIs(100)
    .heightIs(50);
    
    self.message.sd_layout
    .leftSpaceToView(self, 20)
    .rightSpaceToView(self.btn, 0)
    .topEqualToView(self)
    .bottomEqualToView(self);
}

#pragma mark 存取方法


- (YYLabel *)message {
    if (!_message) {
        _message = [Create_Tool CreatLabeltextcolor:Col_666 textfont:[UIFont systemFontOfSize:14]];
    }
    return _message;
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectZero
                                                     taeget:self
                                                        sel:@selector(tap_method)
                                                        tag:0
                                                   AntTitle:LOCALIZATION(@"确定")
                                                  titleFont:16
                                                 titleColor:Col_FFF
                                                   andImage:@"NONONO"
                                               AndBackColor:Col_D81
                                    adjustsFontSizesTowidth:NO
                                              masksToBounds:NO
                                               conrenRadius:0
                                                BorderColor:nil
                                                BorderWidth:0
                                  ContentHorizontalAligment:0];
    }
    return _btn;
}
@end
