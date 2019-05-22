//
//  loginV.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/4/4.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "loginV.h"

@interface loginV ()

/** 时间 */
@property (nonatomic , assign) CGFloat timeAct;
@property (weak, nonatomic) IBOutlet UIButton *XX_btn;

@end

@implementation loginV

- (IBAction)qiehuan:(id)sender {
    if (self.ViewtapClose) {
        self.ViewtapClose(-1, @"");
    }
}

- (IBAction)tapyonghuxieyi:(id)sender {
    if (self.ViewtapClose) {
        self.ViewtapClose(4, @"");
    }
}

- (IBAction)loginmethed:(id)sender {
    NSInteger num;
    NSMutableDictionary *dic = [NSMutableDictionary new];
    if (self.phone_tf.text.length == 0 || self.password_tf.text.length == 0) {
        num = 0;
    }else {
        num = 1;
        [dic setValue:self.phone_tf.text forKey:@"mobile"];
        [dic setValue:self.password_tf.text forKey:@"password"];
        [dic setValue:self.phone_tf.text forKey:@"nickName"];
    }
    if (self.ViewtapClose) {
        self.ViewtapClose(num, dic);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self config];
}



- (void)config {
    self.sure_btn.layer.masksToBounds = YES;
    self.sure_btn.layer.cornerRadius  =4;
    [self.lijilogin setTitle:LOCALIZATION(@"YYZHLJDL") forState:UIControlStateNormal];
    [self.shuoming setTitle:LOCALIZATION(@"ZCJS") forState:UIControlStateNormal];
    self.phone_LAB.text = LOCALIZATION(@"SJH");
    self.password_LAB.text = LOCALIZATION(@"MM");
    self.password_tf.placeholder = LOCALIZATION(@"QSRMM");
    self.phone_tf.placeholder = LOCALIZATION(@"QSRSJH");
    [self.ljzc setTitle:LOCALIZATION(@"LJZC") forState:UIControlStateNormal];
    [self.sure_btn setTitle:LOCALIZATION(@"YYZHLJDL") forState:UIControlStateNormal];
    [self.XX_btn setTitle:LOCALIZATION(@"注册即代表同意《用户协议》") forState:UIControlStateNormal];
    
}




@end
