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
@interface SDViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)NSOperationQueue *queue;
@property (nonatomic,copy)NSString *currentURL;
//定义一个操作缓存
@property (nonatomic,strong)NSMutableDictionary *operationCache;

@end

@implementation SDViewController
//懒加载和字典转模型
- (NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [SDModel apps];
    }
    return _dataArray;
}
//一般是懒加载队列
- (NSOperationQueue *)queue{
    if (_queue == nil) {
        _queue = [[NSOperationQueue alloc]init];
    }
    return _queue;
}
- (NSMutableDictionary *)operationCache{
    if (_operationCache == nil) {
        _operationCache = [NSMutableDictionary dictionary];
    }
    return _operationCache;
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
        //取出上一次操作
        SDDownloadImgOperation *lastOperation = self.operationCache[self.currentURL];
        //取消上一次操作,cancel不能真正的取消操作,只能作为一个判断条件,所以需要手动取消
        [lastOperation cancel];
    }
    
    self.currentURL = model.icon;
    
    //下载图片操作
    SDDownloadImgOperation *downloadOperation = [SDDownloadImgOperation downloadWithImageUrl:model.icon finish:^(UIImage *image) {
        self.iconImage.image = image;
        //删除操作
        [self.operationCache removeObjectForKey:model.icon];
    }];
    //把操作加入到队列继而能执行main方法
    [self.queue addOperation:downloadOperation];
    //把操作加入到操作缓存中
    [self.operationCache setObject:downloadOperation forKey:model.icon];
}
@end












































