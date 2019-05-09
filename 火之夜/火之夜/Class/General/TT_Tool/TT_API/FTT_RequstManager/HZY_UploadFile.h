//
//  HZY_UploadFile.h
//  火之夜
//
//  Created by linlin dang on 2019/5/8.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZY_UploadFile : NSObject
- (void)uploadFileWithURL:(NSURL *)url imageDic:(NSDictionary *)imgDic pramDic:(NSDictionary *)pramDic;
@end

NS_ASSUME_NONNULL_END
