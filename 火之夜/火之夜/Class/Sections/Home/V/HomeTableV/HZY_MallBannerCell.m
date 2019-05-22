//
//  MallBannerCell.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/27.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_MallBannerCell.h"

@interface HZY_MallBannerCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation HZY_MallBannerCell



#pragma mark 生命周期

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = Col_F6F;
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = CGRectMake(10, 10, KScreenWidth - 20, (KScreenWidth - 20) / 25 * 9);
}

#pragma mark 回调协议

#pragma mark 触发方法

#pragma mark 公开方法

#pragma mark 私有方法

#pragma mark 存取方法

- (void)setImageURL:(NSURL *)imageURL {
    //获取当前设备语言
    NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString *languageName = [appLanguages objectAtIndex:0];
    if ([languageName hasPrefix:@"zh-Hans"]) {
        languageName = @"ja";
    }else if ([languageName hasPrefix:@"en"]) {
        languageName = @"en";
    }else if ([languageName hasPrefix:@"ko"]) {
        languageName = @"ko";
    }
    self.imageView.image = [UIImage imageNamed:languageName];
}

@end
