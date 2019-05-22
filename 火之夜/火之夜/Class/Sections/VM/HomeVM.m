//
//  HomeVM.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeVM.h"
#import "HZY_MyaddressModel.h"
#import "HZY_zixunModel.h"
#import "HZY_XiaoxiModel.h"
#import "HZY_ProductInfoModel.h"
#import "HZY_BannerModel.h"
@implementation HomeVM



- (NSDictionary *)paramsForApi:(FTT_APIBaseManager *)Manager {
    //获取当前设备语言
//    NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
//    NSString *languageName = [appLanguages objectAtIndex:0];
//    if ([languageName hasPrefix:@"zh"]) {
//        languageName = @"zh";
//    }
//    NSArray *availableLanguagesArray        = @[@"en",@"ko",@"ja"];
//    NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
//    NSString *languageName = [appLanguages objectAtIndex:0];
//    BOOL isbool = [availableLanguagesArray containsObject:languageName];
//    if (!isbool) {
//        languageName = @"jp";
//    }else if ([languageName isEqualToString:@"ja"]) {
//        languageName = @"jp";
//    }
    NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString *languageName = [appLanguages objectAtIndex:0];
    if ([languageName hasPrefix:@"ja"]) {
        languageName = @"jp";
    }else if ([languageName hasPrefix:@"en"]) {
        languageName = @"en";
    }else if ([languageName hasPrefix:@"ko"]) {
        languageName = @"kor";
    }
    [self.DIC setValue:languageName forKey:@"langFlag"];
    [self.DIC setValue:@"1" forKey:@"appFlag"];
    return self.DIC;
}

- (void)dataConversion:(FTT_APIBaseManager *)Manager {
    if ([Manager.requestMark isEqualToString:registerMARK]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:logonMAKR]) {
        [self loginmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:lunboBannerMarK]) {
        [self configLunbotumethod:Manager];
    }else if ([Manager.requestMark isEqualToString:getProductInfoMARK]) {
        [self configgetProductInfomethod:Manager];
    }else if ([Manager.requestMark isEqualToString:msgListMARK]) {
        [self configmsgListmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:getNewsMARK]) {
        [self configgetNewSmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:mybuyMARK]) {
        [self configmybuymethod:Manager];
    }else if ([Manager.requestMark isEqualToString:uploadTokenMarK]) {
        [self uploadTokenmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:fabuProductMARK]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:queryAddrsMARK]) {
        [self queryAddrsmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:addAddressMARK]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:updateNickNameMARK]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:deleteAddressMARK]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString:updateAddrIsDefaultMARK]) {
        [self ElasticGeneralmethod:Manager];
    }else if ([Manager.requestMark isEqualToString: updateAddressMARK]) {
        [self ElasticGeneralmethod:Manager];
    }

}

- (void)queryAddrsmethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [HZY_MyaddressModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"data"]];
    [self configAllData:Manager.responseObject Data:data success:YES Mark:Manager.requestMark];
}


- (void)uploadTokenmethod:(FTT_APIBaseManager *)Manager {
    SaveObject(Manager.responseObject[@"data"][@"token"], @"IMG_T")
    [self ElasticGeneralmethod:Manager];
}

- (void)configmybuymethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [HZY_ProductInfoModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"data"]];
    [self configAllData:Manager.responseObject Data:data success:YES Mark:Manager.requestMark];
}

- (void)configgetNewSmethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [HZY_zixunModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"data"][@"data"]];
    [self configAllData:Manager.responseObject Data:data success:YES Mark:Manager.requestMark];
}

- (void)configmsgListmethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [HZY_XiaoxiModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"data"]];
    [self configAllData:Manager.responseObject Data:data success:YES Mark:Manager.requestMark];
}

- (void)configgetProductInfomethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [HZY_ProductInfoModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"data"][@"data"]];
    [self configAllData:Manager.responseObject Data:data success:YES Mark:Manager.requestMark];
}


- (void)configLunbotumethod:(FTT_APIBaseManager *)Manager {
    NSMutableArray *data = [HZY_BannerModel mj_objectArrayWithKeyValuesArray:Manager.responseObject[@"data"]];
    [self configAllData:Manager.responseObject Data:data success:YES Mark:Manager.requestMark];
}

- (void)loginmethod:(FTT_APIBaseManager *)Manager {
    NSMutableDictionary *dic = Manager.responseObject[@"data"][0];
    SaveObject(dic, @"user");
    SaveObject(dic[@"id"], @"userId")
    [self ElasticGeneralmethod:Manager];
}

- (void)ElasticGeneralmethod:(FTT_APIBaseManager *)Manager {
    if (self.New_Close) {
        self.New_Close(Manager.responseObject, nil, YES, NO, Manager.requestMark);
    }
}









@end
