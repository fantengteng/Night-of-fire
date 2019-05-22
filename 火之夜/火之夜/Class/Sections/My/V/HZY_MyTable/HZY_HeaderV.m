//
//  HZY_HeaderV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/1.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_HeaderV.h"


@interface HZY_HeaderV ()

@property (nonatomic , strong) UIImageView *header;

@property (nonatomic , strong) UILabel *title;

@property (nonatomic , strong) UILabel *message_lab;

@property (nonatomic , strong) UIButton *btn;

@property (nonatomic , assign) NSInteger type;
@end

@implementation HZY_HeaderV


- (void)tap_btn {
    if (self.ViewtapClose) {
        self.ViewtapClose(self.type, @"");
    }
}

- (void)configImageStr:(NSString *)ImageStr name:(NSString *)name {
    if (!([ImageStr isEqualToString:@""] && [name isEqualToString:@""])) {
        [self.header setImageWithURL:[NSURL URLWithString:ImageStr]
                         placeholder:nil
                             options:YYWebImageOptionProgressive
                             manager:[Create_Tool ImageManager]
                            progress:nil
                           transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
                               return [image imageWithRadius:4 rectSize:CGSizeMake(50, 50)];
                           } completion:nil];
        self.title.text = name;
        self.header.layer.cornerRadius = 4;
        self.header.layer.masksToBounds = YES;
        
        self.type = 1;
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap_btn)];
        [self addGestureRecognizer:tap];
        [self.btn removeFromSuperview];
        [self addSubview:self.header];
        [self addSubview:self.title];
    }else {
        [self.header removeFromSuperview];
        [self.title removeFromSuperview];
        [self.message_lab removeFromSuperview];
        self.type = 2;
        self.btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(KScreenWidth / 2 - 50, 28, 100, 44)
                                                         taeget:self
                                                            sel:@selector(tap_btn)
                                                            tag:0
                                                       AntTitle:LOCALIZATION(@"请登录")
                                                      titleFont:14
                                                     titleColor:Col_D81
                                                       andImage:@"NONONO"
                                                   AndBackColor:nil
                                        adjustsFontSizesTowidth:NO
                                                  masksToBounds:NO
                                                   conrenRadius:4
                                                    BorderColor:Col_D81
                                                    BorderWidth:1
                                      ContentHorizontalAligment:0];
        [self addSubview:self.btn];
    }
}
- (void)tt_setupViews {
    self.header = [TT_ControlTool FTT_ControlToolUIImageViewFrame:CGRectMake(KScreenWidth - 80, 30, 50, 50)
                                                        ImageName:@"MOMO"
                                           userInteractionEnabled:NO
                                                    MasksToBounds:YES
                                                    ConrenrRadius:4
                                                      BorderColor:nil
                                                      BorderWidth:0
                                                       LabelBlock:nil];
    [self.header.image imageWithRadius:4 rectSize:CGSizeMake(50, 50)];
    
    self.title = [TT_ControlTool FTT_ControlToolUILabelFrame:CGRectMake(20, 35, KScreenWidth - 100, 20)
                                                    AndTitle:LOCALIZATION(@"昵称") 
                                                 AndFontSize:15
                                               AndTitleColor:Col_333
                                               Numberoflines:0
                                               TextAlignment:NSTextAlignmentLeft
                                    adjustesFontSizesTowidth:NO
                                               masksToBounds:NO
                                               conrenrRadius:0
                                      userInteractionEnabled:NO
                                                  LabelBlock:nil
                                                  lineIsShow:NO
                                                   lineFrame:CGRectZero];
    self.title.font = [UIFont boldSystemFontOfSize:16];
    
    self.message_lab =  [TT_ControlTool FTT_ControlToolUILabelFrame:CGRectMake(20, CGRectGetMaxY(self.title.frame) + 2, KScreenWidth - 100, 18)
                                                           AndTitle:LOCALIZATION(@"很开心,写点什么") 
                                                        AndFontSize:14
                                                      AndTitleColor:Col_666
                                                      Numberoflines:0
                                                      TextAlignment:NSTextAlignmentLeft
                                           adjustesFontSizesTowidth:NO
                                                      masksToBounds:NO
                                                      conrenrRadius:0
                                             userInteractionEnabled:NO
                                                         LabelBlock:nil
                                                         lineIsShow:NO
                                                          lineFrame:CGRectZero];
    [self addSubview:self.message_lab];
    
    UIView *FengexianV1 = [TT_ControlTool FTT_ControlToolUIViewFrame:CGRectMake(0, 0, KScreenWidth, 10) BackgroundColor:Col_F6F MasksToBounds:NO ConrenrRadius:0];
    [self addSubview:FengexianV1];
    UIView *FengexianV = [TT_ControlTool FTT_ControlToolUIViewFrame:CGRectMake(0, 90, KScreenWidth, 10) BackgroundColor:Col_F6F MasksToBounds:NO ConrenrRadius:0];
    [self addSubview:FengexianV];
    
}


@end
