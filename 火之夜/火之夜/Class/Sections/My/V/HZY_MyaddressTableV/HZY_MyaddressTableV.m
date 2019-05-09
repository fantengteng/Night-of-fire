//
//  HZY_MyaddressTableV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/6.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_MyaddressTableV.h"
#import "HZY_MyaddressCell.h"
@implementation HZY_MyaddressTableV

#pragma mark 生命周期

#pragma mark 回调协议

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZY_MyaddressCell *cell = [HZY_MyaddressCell cellWithTableView:tableView CellClass:[HZY_MyaddressCell class]];
    cell.model = self.infodata[indexPath.row];
    cell.currencyClose = ^(NSInteger num) {
        if (self.tapClose) {
            self.tapClose(num, self.infodata[indexPath.row]);
        }
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  [tableView cellHeightForIndexPath:indexPath model:self.infodata[indexPath.row] keyPath:@"model" cellClass:[HZY_MyaddressCell class] contentViewWidth:KScreenWidth];
}



#pragma mark 触发方法

#pragma mark 公开方法

- (void)configCellXIB {
    self.backgroundColor = Col_F6F;
}


#pragma mark 私有方法

#pragma mark 存取方法

@end
