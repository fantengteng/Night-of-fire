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

@end

@implementation loginV

- (IBAction)qiehuan:(id)sender {
    if (self.ViewtapClose) {
        self.ViewtapClose(-1, @"");
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
- (IBAction)jumpxieyi:(id)sender {
   
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
    [self.sure_btn setTitle:LOCALIZATION(@"LJZC") forState:UIControlStateNormal];
    
}




@end
