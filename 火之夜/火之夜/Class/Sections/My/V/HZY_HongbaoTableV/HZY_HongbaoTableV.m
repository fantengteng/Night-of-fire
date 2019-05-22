//
//  HZY_HongbaoTableV.m
//  火之夜
//
//  Created by linlin dang on 2019/5/16.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_HongbaoTableV.h"
#import "HZY_HongbaoCell.h"
@implementation HZY_HongbaoTableV


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZY_HongbaoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.Lable.text = self.infodata[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}


-(void)configCellXIB {
      [self registerNib:[UINib nibWithNibName:@"HZY_HongbaoCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}



@end
