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
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = CGRectMake(10, 10, KScreenWidth - 20, 127);
}

#pragma mark 回调协议

#pragma mark 触发方法

#pragma mark 公开方法

#pragma mark 私有方法

#pragma mark 存取方法

- (void)setImageURL:(NSURL *)imageURL {
    [self.imageView setImageWithURL:imageURL
                        placeholder:nil
                            options:YYWebImageOptionProgressive
                            manager:[Create_Tool ImageManager]
                           progress:nil
                          transform:nil
                         completion:nil];
}

@end
