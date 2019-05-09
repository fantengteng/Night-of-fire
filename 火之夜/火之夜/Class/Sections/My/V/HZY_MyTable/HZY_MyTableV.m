//
//  HZY_MyTableV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/1.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_MyTableV.h"
#import "HZY_HeaderV.h"


@interface HZY_MyTableV ()

@property (nonatomic , strong) NSMutableArray *arr_IMG;

@property (nonatomic , strong) NSMutableArray *arr_title;

@property (nonatomic , strong) HZY_HeaderV *headeV;

@end

@implementation HZY_MyTableV

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *Cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    Cell.textLabel.text = self.arr_title[indexPath.row];
    Cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr_title.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.TT_delegate != nil && [self.TT_delegate respondsToSelector:@selector(tapcellTriggereventIndex:model:)]) {
        [self celltapDelegateIndexPath:indexPath data:@""];
    }
}

#pragma mark 触发方法


#pragma mark 公开方法

- (void)configDataNew:(id)Data has_more:(BOOL)has_more {
    Exist(@"user") {
        NSDictionary *dic = TakeOut(@"user");
        [self.headeV configImageStr:dic[@"headimg"] name:dic[@"nickname"]];
    }else {
        [self.headeV configImageStr:@"" name:@""];
    }
}

#pragma mark 私有方法

- (void)changeDefaultConfigguration {
    self.headeV = [[HZY_HeaderV alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 220)];
    self.tableHeaderView = self.headeV;
    @weakify(self)
    self.headeV.ViewtapClose = ^(NSInteger num, id  _Nonnull data) {
        @strongify(self)
        if (self.tapClose) {
            self.tapClose(num, data);
        }
    };

    _arr_title = [NSMutableArray arrayWithArray:@[LOCALIZATION(@"WDGM"),LOCALIZATION(@"WDFB"),LOCALIZATION(@"SHDZ"),LOCALIZATION(@"SZ"),]];
}


#pragma mark 存取方法

@end
