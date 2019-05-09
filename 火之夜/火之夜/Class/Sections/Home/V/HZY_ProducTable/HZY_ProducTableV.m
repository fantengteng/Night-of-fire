//
//  HZY_ProducTableV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/7.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_ProducTableV.h"
#import "HZY_ProducCell.h"
@implementation HZY_ProducTableV

#pragma mark 生命周期

#pragma mark 回调协议

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZY_ProducCell *Cell = [HZY_ProducCell cellWithTableView:tableView CellClass:[HZY_ProducCell class]];
    Cell.model = self.infodata[indexPath.row];
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  [tableView cellHeightForIndexPath:indexPath model:self.infodata[indexPath.row] keyPath:@"model" cellClass:[HZY_ProducCell class] contentViewWidth:KScreenWidth];
}


@end
