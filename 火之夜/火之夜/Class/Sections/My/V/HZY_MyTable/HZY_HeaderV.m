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
                               return [image imageWithRadius:31 rectSize:CGSizeMake(62, 62)];
                           } completion:nil];
        self.title.text = name;
        self.header.layer.cornerRadius = 31;
        self.header.layer.masksToBounds = YES;
        
        self.type = 1;
        [self.btn removeFromSuperview];
        [self addSubview:self.header];
        [self addSubview:self.title];
    }else {
        [self.header removeFromSuperview];
        [self.title removeFromSuperview];
        self.type = 2;
        self.btn = [TT_ControlTool FTT_ControlToolUIButtonFrame:CGRectMake(KScreenWidth / 2 - 50, 110 - 22, 100, 44)
                                                         taeget:self
                                                            sel:@selector(tap_btn)
                                                            tag:0
                                                       AntTitle:@"请登录"
                                                      titleFont:14
                                                     titleColor:Col_FFF
                                                       andImage:@"NONONO"
                                                   AndBackColor:nil
                                        adjustsFontSizesTowidth:NO
                                                  masksToBounds:NO
                                                   conrenRadius:4
                                                    BorderColor:Col_FFF
                                                    BorderWidth:1
                                      ContentHorizontalAligment:0];
        [self addSubview:self.btn];
    }
}
- (void)tt_setupViews {
    self.backgroundColor = Col_D81;
    self.header = [TT_ControlTool FTT_ControlToolUIImageViewFrame:CGRectMake(KScreenWidth / 2 - 31, 220 / 2 - 43.5, 62, 62)
                                                        ImageName:@"MOMO"
                                           userInteractionEnabled:NO
                                                    MasksToBounds:YES
                                                    ConrenrRadius:31
                                                      BorderColor:Col_FFF
                                                      BorderWidth:2
                                                       LabelBlock:nil];
    [self.header.image imageWithRadius:31 rectSize:CGSizeMake(62, 62)];
    self.header.image = [UIImage imageWithColor:Col_FFF];
    
    self.title = [TT_ControlTool FTT_ControlToolUILabelFrame:CGRectMake(0, CGRectGetMaxY(self.header.frame) + 5, KScreenWidth, 20)
                                                    AndTitle:@"昵称"
                                                 AndFontSize:15
                                               AndTitleColor:Col_FFF
                                               Numberoflines:0
                                               TextAlignment:NSTextAlignmentCenter
                                    adjustesFontSizesTowidth:NO
                                               masksToBounds:NO
                                               conrenrRadius:0
                                      userInteractionEnabled:NO
                                                  LabelBlock:nil
                                                  lineIsShow:NO
                                                   lineFrame:CGRectZero];
    
}


@end
