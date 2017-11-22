//
//  SDDownloadImgOperation.h
//  模拟SD
//
//  Created by 曹魏 on 2017/11/20.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SDDownloadImgOperation : NSOperation
//图片下载地址
@property (nonatomic,copy)NSString *imgURL;
//定义block属性
@property (nonatomic,copy)void(^finishBlock)(UIImage *image);

//我需要一个类方法进行数据传递
+ (instancetype)downloadWithImageUrl:(NSString *)urlString finish:(void(^)(UIImage *))finishBlock;
@end
