//
//  SDDownloadImgOperation.m
//  模拟SD
//
//  Created by 曹魏 on 2017/11/20.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "SDDownloadImgOperation.h"

@implementation SDDownloadImgOperation
+ (instancetype)downloadWithImageUrl:(NSString *)urlString finish:(void(^)(UIImage *))finishBlock{
    SDDownloadImgOperation *operation = [[SDDownloadImgOperation alloc]init];
    operation.imgURL = urlString;
    operation.finishBlock = finishBlock;
    return operation;
}
//开启下载
- (void)main{
    //模拟网络延时
    NSURL *url = [NSURL URLWithString:self.imgURL];
    [NSThread sleepForTimeInterval:1];
    NSData *data = [NSData dataWithContentsOfURL:url];
    //data是个耗时任务,在这里取消
    if ([self isCancelled]) {
        return;
    }
    
    
    UIImage *image = [UIImage imageWithData:data];
    //把下载好的image传递给控制器
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        self.finishBlock(image);
    }];
}


@end
