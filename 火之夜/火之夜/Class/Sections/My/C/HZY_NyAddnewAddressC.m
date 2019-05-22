//
//  NyAddnewAddressC.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/4/3.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_NyAddnewAddressC.h"
#import "JYAddressPicker.h"
@interface HZY_NyAddnewAddressC ()
@property (weak, nonatomic) IBOutlet UILabel *selectadd_label;
@property (nonatomic, strong) NSArray *selectedArr;
@end

@implementation HZY_NyAddnewAddressC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tt_changeDefauleConfiguration];
    if (self.addressModel) {
        self.name_tf.text = self.addressModel.name;
        self.phoen_tf.text = self.addressModel.mobile;
        self.selectadd_label.text = self.addressModel.address;
    }
    
}
#pragma mark 回调协议

#pragma mark 界面跳转

#pragma mark 触发方法

- (IBAction)save:(id)sender {
    if (self.name_tf.text.length == 0 || self.phoen_tf.text.length == 0 || self.selectadd_label.text.length == 0 || self.xiangxi_tf.text.length == 0) {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"信息不能为空"
                                          AndView:self.view AndMode:MBProgressHUDModeText
                                         AndImage:nil
                                    AndAfterDelay:1
                                          AndBack:nil];
    }else {
        if (self.addressModel) {
            [self configDataforMARK:updateAddressMARK];
        }else {
            [self configDataforMARK:addAddressMARK];
        }
    }
}

- (void)configDataforMARK:(NSString *)MARK {
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"正在提交，请稍后!!!" AndView:self.view AndMode:MBProgressHUDModeIndeterminate AndImage:@"NONONO" AndBack:nil];
    NSMutableDictionary *dic = [NSMutableDictionary new];
    USER_ID
    [dic setValue:usee_id forKey:@"memberId"];
    [dic setValue:[self.name_tf.text URLEncodedString] forKey:@"name"];
    [dic setValue:[ [NSString stringWithFormat:@"%@%@",self.selectadd_label.text,self.xiangxi_tf.text] URLEncodedString] forKey:@"address"];
    [dic setValue:self.phoen_tf.text forKey:@"mobile"];
    [self configDataforNewnetWorkname:MARK params:dic networkClass:[HomeAPI class]];
}

- (void)Tap {
    if (self.selectedArr) {
        NSArray *defaultValues = @[[self.selectedArr objectAtIndex:0][@"text"],[self.selectedArr objectAtIndex:1][@"text"],[self.selectedArr objectAtIndex:2][@"text"]];
        JYAddressPicker *addressPicker = [JYAddressPicker jy_showAt:self defaultShow:defaultValues];
        addressPicker.selectedItemBlock = ^(NSArray *addressArr) {
            
            NSString *province = [addressArr objectAtIndex:0][@"text"];
            NSString *city = [addressArr objectAtIndex:1][@"text"];
            NSString *county = [addressArr objectAtIndex:2][@"text"];
            self.selectadd_label.textColor = Col_333;
            self.selectadd_label.text = [NSString stringWithFormat:@"%@%@%@",province,city,county];
            self.selectedArr = addressArr;
        };
    }else{
        JYAddressPicker *addressPicker = [JYAddressPicker jy_showAt:self];
        addressPicker.selectedItemBlock = ^(NSArray *addressArr) {
            
            NSString *province = [addressArr objectAtIndex:0][@"text"];
            NSString *city = [addressArr objectAtIndex:1][@"text"];
            NSString *county = [addressArr objectAtIndex:2][@"text"];
            self.selectadd_label.textColor = Col_333;
            self.selectadd_label.text = [NSString stringWithFormat:@"%@%@%@",province,city,county];
            self.selectedArr = addressArr;
        };
        
    }
}
#pragma mark 公开方法

- (void)tt_addSubviews {
    self.selectadd_label.userInteractionEnabled = YES;
    self.sure_btn.layer.masksToBounds = YES;
    self.sure_btn.layer.cornerRadius = 4;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Tap)];
    [self.selectadd_label addGestureRecognizer:tap];
}

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
}


- (void)configSuccessTankuang:(NSString *)mark {
    NSString *ST;
    if ([mark isEqualToString:updateAddressMARK]) {
        ST = @"更新成功";
    }else if ([mark isEqualToString:addAddressMARK]) {
        ST = @"添加成功";
    }
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:ST AndView:self.view
                                      AndMode:MBProgressHUDModeText
                                     AndImage:@"NONO"
                                AndAfterDelay:1
                                      AndBack:^{
                                          [self.navigationController popViewControllerAnimated:YES];
                                      }];
}


#pragma mark 私有方法

#pragma mark 存取方法


@end
