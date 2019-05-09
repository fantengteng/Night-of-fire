//
//  HomeVM.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeVM.h"

#import "HZY_zixunModel.h"
#import "HZY_XiaoxiModel.h"
#import "HZY_ProductInfoModel.h"
#import "HZY_BannerModel.h"
@implementation HomeVM



- (NSDictionary *)paramsForApi:(FTT_APIBaseManager *)Manager {
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
    }

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
    NSDictionary *dic = Manager.responseObject[@"data"][0];
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
