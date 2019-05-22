//
//  HZY_UITool.h
//  火之夜
//
//  Created by linlin dang on 2019/5/11.
//  Copyright © 2019 FTT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZY_UITool : UIView

@property (nonatomic , strong) NSString *title_str;

@property (nonatomic , strong) UITextField *tf;

- (void)createleftStr:(NSString *)Str textfiledplacehold:(NSString *)placehold;

@end

NS_ASSUME_NONNULL_END
