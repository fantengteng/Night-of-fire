//
//  HZY_HongbaoC.m
//  火之夜
//
//  Created by linlin dang on 2019/5/16.
//  Copyright © 2019 FTT. All rights reserved.
//

#import "HZY_HongbaoC.h"
#import "HZY_HongbaoTableV.h"
@interface HZY_HongbaoC ()
@property (nonatomic , strong) HZY_HongbaoTableV *TableV;
@property (nonatomic , strong) NSMutableArray *arr ;
@end


@implementation HZY_HongbaoC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Is_hideJuhuazhuan = NO;
}


- (void)tapcellTriggereventIndex:(NSIndexPath *)index model:(id)model {
    if (self.HB_Delegate && self.type == 1) {
        [self.HB_Delegate tap_money:self.arr[index.row]];
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)tt_addSubviews {
    self.arr = [NSMutableArray arrayWithArray:@[@"100",@"100",@"100",@"200",@"380"]];
    [self setupTableV:[HZY_HongbaoTableV class]];
    [self.TableV configDataNew:self.arr has_more:NO];
   
}

@end
