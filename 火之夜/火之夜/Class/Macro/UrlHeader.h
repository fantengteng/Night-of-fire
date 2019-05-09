
//
//  UrlHeader.h
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#ifndef UrlHeader_h
#define UrlHeader_h


//#define PZ_Header      @"http://180.76.187.247:8080/appcenter/app/"


#define PZ_Header   @"http://192.168.1.218:8080/appcenter/app/"

/// === 注册 === ///

#define registerMARK @"register"

#define logonMAKR @"logon"



/// 轮播图
#define lunboBannerMarK @"lunboBanner"
/// 获取首页信息
#define getProductInfoMARK @"getProductInfo"
/// 消息列表
#define msgListMARK @"msgList"
/// 新闻列表
#define getNewsMARK @"getNews"
/// 我的购买
#define mybuyMARK @"mybuy"

#define fabuProductMARK @"fabuProduct"

#define imgUploadMARK @"imgUpload"




#define USER_ID \
NSString *usee_id;\
Exist(@"userId"){\
usee_id = TakeOut(@"userId");\
}else {\
usee_id = @"";\
}\

#define Token \
NSString *token;\
Exist(@"token") {\
token = TakeOut(@"token");\
}else {\
token = @"";\
}\

#endif /* UrlHeader_h */
