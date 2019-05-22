//
//  HZY_XinxianCollectionV.m
//  火之夜
//
//  Created by linlin dang on 2019/4/30.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_XinxianCollectionV.h"
#import "HZY_XinRenCell.h"
@implementation HZY_XinxianCollectionV





#pragma mark 生命周期

#pragma mark 回调协议

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return self.Data.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize Size ;
    Size =  CGSizeMake(([UIScreen mainScreen].bounds.size.width - 40) / 2,([UIScreen mainScreen].bounds.size.width - 40) / 2 + 115);
    return Size;
}





#pragma mark 触发方法

#pragma mark 公开方法

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [self setupCollectionView:collectionView indexPath:indexPath CellName:@"CELL" data:self.Data[indexPath.row]];
}



- (void)configCellXIB {
    self.backgroundColor = Col_F6F;
    self.LineSpace = 10;
    [self registerClass:[HZY_XinRenCell class] forCellWithReuseIdentifier:@"CELL"];

}

- (void)tapCollectionCellTriggermethodfortype:(NSInteger)type Data:(id)Data CellName:(NSString *)CellName {

}
#pragma mark 私有方法


#pragma mark 存取方法




@end
