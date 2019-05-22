//
//  HZY_ChangeNickC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/13.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_ChangeNickC.h"

@interface HZY_ChangeNickC ()
@property (weak, nonatomic) IBOutlet UITextField *changnick;
@property (weak, nonatomic) IBOutlet UIButton *sure_btn;

@end

@implementation HZY_ChangeNickC

#pragma mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark 回调协议

#pragma mark 界面跳转

#pragma mark 触发方法

- (IBAction)sure_method:(id)sender {
    [self configData];
}
#pragma mark 公开方法

- (void)configData {
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"正在提交，请稍后!!!" AndView:self.view AndMode:MBProgressHUDModeIndeterminate AndImage:@"NONONO" AndBack:nil];
    USER_ID
    NSDictionary *dict = TakeOut(@"user");
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setValue:usee_id forKey:@"memberId"];
    [dic setValue:self.changnick.text forKey:@"nickName"];
    [dic setValue:dict[@"headimg"] forKey:@"headimg"];
    [self configDataforNewnetWorkname:updateNickNameMARK params:dic networkClass:[HomeAPI class]];
}

- (void)configSuccessTankuang:(NSString *)mark {
    [[FTT_HudTool share_FTT_HudTool]CreateHUD:@"修改成功" AndView:self.view AndMode:MBProgressHUDModeText AndImage:@"NONONO" AndAfterDelay:1 AndBack:^{
       
    }];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:TakeOut(@"user")];
    
    dict[@"nickname"] = self.changnick.text;
    SaveObject(dict, @"user");
}

#pragma mark 私有方法

- (void)tt_changeDefauleConfiguration {
    self.Is_hideJuhuazhuan = NO;
    self.view.backgroundColor = Col_FFF;
}

- (void)tt_addSubviews {
    self.sure_btn.layer.cornerRadius = 4;
    self.sure_btn.layer.masksToBounds = YES;
}


#pragma mark 存取方法




@end
