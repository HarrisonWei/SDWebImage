//
//  SDViewController.m
//  模拟SD
//
//  Created by 曹魏 on 2017/11/20.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "SDViewController.h"
#import "SDModel.h"
@interface SDViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (nonatomic,strong)NSArray *dataArray;
@end

@implementation SDViewController
//懒加载和字典转模型
- (NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [SDModel apps];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
