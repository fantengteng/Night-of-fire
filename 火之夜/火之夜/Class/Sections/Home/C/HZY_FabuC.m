//
//  HZY_FabuC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/6.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_FabuC.h"
#import "TT_TextView.h"
#import "PhotoCollectionViewCell.h"
#import "TT_CollectionIMGV.h"
#import "HZY_UploadFile.h"
#import "HZY_UITool.h"
@interface HZY_FabuC ()
@property (nonatomic , strong) TT_TextView *TextV;
@property (nonatomic , strong) TT_CollectionIMGV *IMGV;
@property (nonatomic , strong) UIButton *SureBtn;
@property (nonatomic , strong) UIButton *Close_btn;
@property (nonatomic , assign) BOOL is_loadtoken;
@property (nonatomic , strong) HZY_UploadFile *up;
@property (nonatomic , strong) HZY_UITool *PriceLab;
@property (nonatomic , strong) HZY_UITool *biaotiLab;
@end

@implementation HZY_FabuC


#pragma mark 生命周期


- (void)viewDidLoad {
    [super viewDidLoad];
    [self tt_changeDefauleConfiguration];
    [self configData];
}


#pragma mark 回调协议


#pragma mark 界面跳转


#pragma mark 触发方法

- (void)sure {
    if ([self.TextV.text isEqualToString:self.TextV.tt_placeholder] || self.TextV.text.length == 0 || self.IMGV.selectedPhotos.count == 0) {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:LOCALIZATION(@"发布内容不能为空") AndView:self.view AndMode:MBProgressHUDModeText AndImage:nil AndAfterDelay:1 AndBack:nil];
    }else {
        [[FTT_HudTool share_FTT_HudTool]CreateHUD:LOCALIZATION(@"正在提交,请稍后") AndView:self.view AndMode:MBProgressHUDModeIndeterminate AndImage:nil AndBack:nil];
        NSString *token = TakeOut(@"IMG_T");
        QNConfiguration *config = [QNConfiguration build:^(QNConfigurationBuilder *builder) {
            builder.zone = [QNFixedZone zone1];
        }];
        QNUploadManager *upManager = [[QNUploadManager alloc] initWithConfiguration:config];
        [self uploadImages:self.IMGV.selectedPhotos atIndex:0 token:token uploadManager:upManager keys:[NSMutableArray new]];
    }
}

- (void)tap_close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)uploadImages:(NSArray *)images atIndex:(NSInteger)index token:(NSString *)token uploadManager:(QNUploadManager *)uploadManager keys:(NSMutableArray *)keys{
    UIImage *image = images[index];
    __block NSInteger imageIndex = index;
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    NSTimeInterval time= [[NSDate new] timeIntervalSince1970];
    NSString *filename = [NSString stringWithFormat:@"%@_%ld_%.f.%@",@"status",686734963504054272,time,@"jpg"];
    [uploadManager  putData:data key:filename token:token
                  complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                      if (info.isOK) {
                          [keys addObject:[NSString stringWithFormat:@"http://tt.midichan.com/%@",key]];
                          TT_Log(@"idInex %ld,OK    %@  --------%@",index,info.host,info.serverIp);
                          TT_Log(@"%@",[NSString stringWithFormat:@"%@%@",info.host,key]);
                          imageIndex++;
                          if (imageIndex >= images.count) {
                              TT_Log(@"上传完成");
                              NSString *imageURL;
                              for (int i = 0 ; i < images.count ; i++) {
                                  
                                  if (i != 0) {
                                       imageURL = [NSString stringWithFormat:@"------%@",keys[i]];
                                  }else {
                                      imageURL = keys[i];
                                  }
                                 
                              }
                              if (keys.count == images.count) {
                                  USER_ID
                                  NSMutableDictionary *dic = [NSMutableDictionary new];
                                 
                                  [dic setValue:[self.biaotiLab.title_str URLEncodedString] forKey:@"title"];
                                  [dic setValue:usee_id forKey:@"memberId"];
                                  [dic setValue:self.PriceLab.title_str  forKey:@"price"];
                                  [dic setValue:[self.TextV.text URLEncodedString]forKey:@"discription"];
                                  [dic setValue:imageURL forKey:@"imgUrls"];
                                  [self configDataforNewnetWorkname:fabuProductMARK  params:dic networkClass:[HomeAPI class]];
                              }
                              return ;
                          }
                          [self uploadImages:images atIndex:imageIndex token:token uploadManager:uploadManager keys:keys];
                      }else {
                          TT_Log(@"%@",info.error);
                      }
                      
                  } option:nil];
    
   

   
    
}

         
#pragma mark 公开方法

- (void)tt_addSubviews {
    self.view.backgroundColor = Col_FFF ;
    [self setupVM:[HomeVM class]];
    [self.view addSubview:self.Close_btn];
    [self.view addSubview:self.biaotiLab];
    [self.view addSubview:self.PriceLab];
    [self.view addSubview:self.TextV];
    [self.view addSubview:self.IMGV];
    [self.view addSubview:self.SureBtn];
    [self setupVM:[HomeVM class]];
    [self tt_allClose];
}

- (void)tt_allClose {
    @weakify(self)
    self.IMGV.ChangeFrame = ^(CGFloat H) {
        @strongify(self)
        self.IMGV.frame = CGRectMake(5, CGRectGetMaxY(self.TextV.frame) + 5,  KScreenWidth - 10, H);
        self.SureBtn.frame = CGRectMake(15, CGRectGetMaxY(self.IMGV.frame) + 45, KScreenWidth - 30, 44);
    };
}

- (void)configData {
    [self configDataforNewnetWorkname:uploadTokenMarK params:[NSMutableDictionary new] networkClass:[HomeAPI class]];
}

- (void)tt_changeDefauleConfiguration {
    self.title = LOCALIZATION(@"发布") ;
    self.Is_hideJuhuazhuan = NO;
}

- (void)configSuccessTankuang:(NSString *)mark {
    if ([mark isEqualToString:uploadTokenMarK]) {
        self.is_loadtoken = YES;
    }else if ([mark isEqualToString:fabuProductMARK]) {
        [[FTT_HudTool share_FTT_HudTool]dissmiss];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark 私有方法


#pragma mark 存取方法

- (TT_TextView *)TextV {
    if (!_TextV) {
        IPhoneXHeigh
        _TextV = [[TT_TextView alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(self.biaotiLab.frame) + 10, KScreenWidth - 30, 190)];
        _TextV.backgroundColor = Col_FFF;
        _TextV.layer.cornerRadius = 4;
        _TextV.layer.borderColor = Col_ECE.CGColor;
        _TextV.layer.borderWidth = 1;
        
        _TextV.tt_placeholder = LOCALIZATION(@"请输入要发布的内容");
    }
    return _TextV;
}


- (HZY_UITool *)PriceLab {
    if (!_PriceLab) {
        IPhoneXHeigh
        _PriceLab = [[HZY_UITool alloc]initWithFrame:CGRectMake(20, securitytop_Y + 15 , KScreenWidth - 30, 50)];
        [_PriceLab createleftStr:LOCALIZATION(@"价钱")  textfiledplacehold:LOCALIZATION(@"请输入价钱")];
        _PriceLab.tf.keyboardType =  UIKeyboardTypeNumbersAndPunctuation;
    }
    return _PriceLab;
}


- (HZY_UITool *)biaotiLab {
    if (!_biaotiLab) {
        IPhoneXHeigh
        _biaotiLab = [[HZY_UITool alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.PriceLab.frame) + 10 , KScreenWidth - 30, 50)];
        [_biaotiLab createleftStr:LOCALIZATION(@"标题")  textfiledplacehold:LOCALIZATION(@"请输入标题") ];
    }
    return _biaotiLab;
}


- (TT_CollectionIMGV *)IMGV {
    if (!_IMGV) {
        _IMGV = [[TT_CollectionIMGV alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.TextV.frame) + 5,  KScreenWidth - 10, (KScreenWidth - 30 - 20 ) / 3  + 10 )];
        _IMGV.VC = self;
    }
    return _IMGV;
}


- (UIButton *)Close_btn {
    if (!_Close_btn) {
        IPhoneXHeigh
        _Close_btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(20, securitytop_Y - 44, 44, 44) taeget:self sel:@selector(tap_close) tag:0 AntTitle:nil titleFont:0 titleColor:nil andImage:@"" AndBackColor:nil adjustsFontSizesTowidth:NO masksToBounds:NO conrenRadius:0 BorderColor:nil BorderWidth:0 ContentHorizontalAligment:0];
        [_Close_btn setImage:[[UIImage imageNamed:@"Close"]imageByResizeToSize:CGSizeMake(22, 22)]  forState:UIControlStateNormal];
    }
    return _Close_btn;
}

- (UIButton *)SureBtn {
    if (!_SureBtn) {
        _SureBtn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(15, CGRectGetMaxY(self.IMGV.frame) + 45, KScreenWidth - 30, 44)
                                                         taeget:self
                                                            sel:@selector(sure)
                                                            tag:0
                                                       AntTitle:LOCALIZATION(@"发布")
                                                      titleFont:16
                                                     titleColor:Col_FFF
                                                       andImage:nil
                                                   AndBackColor:Col_D81
                                        adjustsFontSizesTowidth:NO
                                                  masksToBounds:YES
                                                   conrenRadius:2
                                                    BorderColor:nil
                                                    BorderWidth:0
                                      ContentHorizontalAligment:0];
    }
    return _SureBtn;
}
@end

