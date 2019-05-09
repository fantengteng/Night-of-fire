//
//  loginV.h
//  捕鱼达人
//
//  Created by linlin dang on 2019/4/4.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TT_BaseV.h"
NS_ASSUME_NONNULL_BEGIN

@interface loginV : TT_BaseV
@property (weak, nonatomic) IBOutlet UIButton *lijilogin;
@property (weak, nonatomic) IBOutlet UIButton *shuoming;
@property (weak, nonatomic) IBOutlet UILabel *password_LAB;
@property (weak, nonatomic) IBOutlet UILabel *phone_LAB;
@property (weak, nonatomic) IBOutlet UITextField *phone_tf;
@property (weak, nonatomic) IBOutlet UITextField *password_tf;
@property (weak, nonatomic) IBOutlet UIButton *sure_btn;
@end

NS_ASSUME_NONNULL_END
