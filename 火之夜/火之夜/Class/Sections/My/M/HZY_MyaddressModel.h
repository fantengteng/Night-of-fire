//
//  HZY_MyaddressModel.h
//  火之夜
//
//  Created by linlin dang on 2019/5/6.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZY_MyaddressModel : NSObject
//{
//    "address": "海南省海口市平安大街1号平安大厦2楼",
//    "mobile": "15203665555",
//    "id": 10,
//    "default": 1,
//    "memberId": 11,
//    "name": "李斯"
//},


@property (nonatomic , copy) NSString *address;

@property (nonatomic , copy) NSString *mobile;

@property (nonatomic , assign) NSInteger ID;

@property (nonatomic , assign) NSInteger Default;

@property (nonatomic , assign) NSInteger memberId;

@property (nonatomic , copy) NSString *name;

@property (nonatomic , copy) NSString *httpUrl;



@end

NS_ASSUME_NONNULL_END
