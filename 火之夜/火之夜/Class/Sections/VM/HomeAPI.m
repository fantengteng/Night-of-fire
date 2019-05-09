//
//  HomeAPI.m
//  捕鱼达人
//
//  Created by linlin dang on 2019/3/26.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HomeAPI.h"

@implementation HomeAPI


- (void)configrequestMark:(NSString *)requestMark {
    self.requestType = FTT_APIManagerRequestTypeGET;
    if ([requestMark isEqualToString:imgUploadMARK]) {
        self.requestType = FTT_APIManagerRequestTypeUpload;
    }
    self.requestUrl  = [NSString stringWithFormat:@"%@%@",PZ_Header,requestMark];
    self.requestMark = requestMark;
}
@end
