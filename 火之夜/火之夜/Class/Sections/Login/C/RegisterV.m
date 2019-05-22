//
//  RegisterV.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/4/4.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "RegisterV.h"

@implementation RegisterV

- (void)awakeFromNib {
    [super awakeFromNib];
    [self config];
}

- (IBAction)qiehuan:(id)sender {
    if (self.ViewtapClose) {
        self.ViewtapClose(-1, @"");
    }
}
- (IBAction)yonghuxieyi:(id)sender {
    if (self.ViewtapClose) {
        self.ViewtapClose(4, @"");
    }
}

- (IBAction)sure:(id)sender {
    NSInteger num;
    NSMutableDictionary *dic = [NSMutableDictionary new];
    if (self.phone_tf.text.length == 0 || self.password_tf.text.length == 0) {
        num = 0;
    }else {
        num = 1;
        [dic setValue:self.phone_tf.text forKey:@"mobile"];
        [dic setValue:self.password_tf.text forKey:@"password"];
    }
    
    if (self.ViewtapClose) {
        self.ViewtapClose(num, dic);
    }
    
}

- (void)config {
    self.login_btn.layer.masksToBounds = YES;
    self.login_btn.layer.cornerRadius  =4;
    [self.login_btn setTitle:LOCALIZATION(@"LJDL") forState:UIControlStateNormal];
    [self.zhuce setTitle:LOCALIZATION(@"MYZHLJZC") forState:UIControlStateNormal];
    self.phone_LAB.text = LOCALIZATION(@"SJH");
    self.password_LAB.text = LOCALIZATION(@"MM");
    self.password_tf.placeholder = LOCALIZATION(@"QSRMM");
    self.phone_tf.placeholder = LOCALIZATION(@"QSRSJH");
    [self.XX_btn setTitle:LOCALIZATION(@"登录即代表同意《用户协议》") forState:UIControlStateNormal];
    
}

@end
