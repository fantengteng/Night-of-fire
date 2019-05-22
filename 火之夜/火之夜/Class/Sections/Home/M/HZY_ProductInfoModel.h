//
//  HZY_ProductInfoModel.h
//  火之夜
//
//  Created by linlin dang on 2019/5/7.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZY_ProductInfoModel : NSObject

@property (nonatomic , copy) NSString *createtime;

@property (nonatomic , copy) NSString *userImg;

@property (nonatomic , copy) NSString *discription;

@property (nonatomic , copy) NSMutableArray *headimg;

@property (nonatomic , assign)  NSInteger price;

@property (nonatomic , assign) NSInteger ID;

@property (nonatomic , copy) NSString *nickeName;

@property (nonatomic , copy) NSString *title;

@property (nonatomic , assign) NSInteger memberid;
@end

NS_ASSUME_NONNULL_END
