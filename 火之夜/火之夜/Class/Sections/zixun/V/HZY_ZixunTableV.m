//
//  HZY_ZixunTableV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/1.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_ZixunTableV.h"
#import "HZY_ZIxunCell.h"
@implementation HZY_ZixunTableV


#pragma mark 生命周期

#pragma mark 回调协议


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZY_ZIxunCell * Cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [Cell configData:self.infodata[indexPath.row]];
    return Cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  90;
}

#pragma mark 触发方法

- (void)celltapCloseNum:(NSInteger)num data:(id)data {
    if (self.tapClose) {
        self.tapClose(num, data);
    }
}
#pragma mark 公开方法

- (void)configCellXIB {
    [self registerNib:[UINib nibWithNibName:@"HZY_ZIxunCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}

#pragma mark 私有方法

#pragma mark 存取方法

@end
