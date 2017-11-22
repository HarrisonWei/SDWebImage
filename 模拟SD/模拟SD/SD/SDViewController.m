//
//  SDViewController.m
//  模拟SD
//
//  Created by 曹魏 on 2017/11/20.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "SDViewController.h"
#import "SDModel.h"
#import "SDDownloadImgOperation.h"
#import "SDDownloadManager.h"
@interface SDViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (nonatomic,strong)NSArray *dataArray;

@property (nonatomic,copy)NSString *currentURL;


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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self displayImg];
}
//随机显示图片
- (void)displayImg{
    
    //定义一个随机数
    u_int32_t number = arc4random_uniform((u_int32_t)self.dataArray.count);
    //取出模型数据
    SDModel *model = self.dataArray[number];
    if (![self.currentURL isEqualToString:model.icon]) {
        [[SDDownloadManager sharedManager]cancelOperationWithStr:self.currentURL];
    }
    
    self.currentURL = model.icon;
    
    //下载图片操作
    [[SDDownloadManager sharedManager]downloadWithIMGUrl:model.icon finish:^(UIImage *image) {
        
        //赋值操作
        self.iconImage.image = image;
    }];
}
@end












































