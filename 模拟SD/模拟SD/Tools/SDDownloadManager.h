//
//  SDDownloadManager.h
//  模拟SD
//
//  Created by 曹魏 on 2017/11/22.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SDDownloadManager : NSObject
+ (instancetype)sharedManager;
//我需要一个类方法进行数据传递
- (void)downloadWithIMGUrl:(NSString *)urlString finish:(void(^)(UIImage *))finishBlock;
//取消操作封装
- (void)cancelOperationWithStr:(NSString *)url;
@end
