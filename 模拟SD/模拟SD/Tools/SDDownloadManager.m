//
//  SDDownloadManager.m
//  模拟SD
//
//  Created by 曹魏 on 2017/11/22.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "SDDownloadManager.h"
#import "SDDownloadImgOperation.h"
#import "NSString+Path.h"
@interface SDDownloadManager()
@property (nonatomic,strong)NSOperationQueue *queue;
//定义一个操作缓存
@property (nonatomic,strong)NSMutableDictionary *operationCache;
//定义一个内存缓存
@property (nonatomic,strong)NSMutableDictionary *imageCache;

@end

@implementation SDDownloadManager
+ (instancetype)sharedManager{
    static SDDownloadManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
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

- (NSMutableDictionary *)imageCache{
    if (_imageCache == nil) {
        _imageCache = [NSMutableDictionary dictionary];
    }
    return _imageCache;
}


- (void)downloadWithIMGUrl:(NSString *)urlString finish:(void(^)(UIImage *))finishBlock{
    //下载图片操作
    SDDownloadImgOperation *downloadOperation = [SDDownloadImgOperation downloadWithImageUrl:urlString finish:^(UIImage *image) {
        //从内存中取出下载好的图片
        UIImage *cacheImg = self.imageCache[urlString];
        //判断
        if (cacheImg) {
            finishBlock(cacheImg);
            return;
        }else{
            //沙盒缓存
            UIImage *sandBoxImg = [UIImage imageWithContentsOfFile:[urlString appendCachePath]];
            if (sandBoxImg) {
                finishBlock(sandBoxImg);
                //优化 写到内存缓存中
                [self.imageCache setObject:sandBoxImg forKey:urlString];
                
                return;
            }
        }
        
        
        //删除操作
        [self.operationCache removeObjectForKey:urlString];
        //把下载好的图片缓存到内存中
        [self.imageCache setObject:image forKey:urlString];
    }];
    //加入到队列
    [self.queue addOperation:downloadOperation];
    //加入到操作缓存中
    [self.operationCache setObject:downloadOperation forKey:urlString];
}

- (void)cancelOperationWithStr:(NSString *)url{
    //取出上一次操作
    SDDownloadImgOperation *lastOperation = self.operationCache[url];
    //取消上一次操作,cancel不能真正的取消操作,只能作为一个判断条件,所以需要手动取消
    [lastOperation cancel];
}







@end






















