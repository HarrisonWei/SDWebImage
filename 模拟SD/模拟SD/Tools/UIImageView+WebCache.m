//
//  UIImageView+WebCache.m
//  模拟SD
//
//  Created by 曹魏 on 2017/11/23.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "UIImageView+WebCache.h"
#import "SDDownloadManager.h"
#import <objc/runtime.h>
@implementation UIImageView (WebCache)


const char *Key = "key";
- (void)setCurrentURL:(NSString *)currentURL{
    //给对象设置数据
    objc_setAssociatedObject(self, Key, currentURL, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSString *)currentURL{
    return objc_getAssociatedObject(self, Key);
}


- (void)downloadWithUrlString:(NSString *)urlString{
    if (![self.currentURL isEqualToString:urlString]) {
        [[SDDownloadManager sharedManager]cancelOperationWithStr:self.currentURL];
    }
    
    self.currentURL = urlString;
    
    //下载图片操作
    [[SDDownloadManager sharedManager]downloadWithIMGUrl:urlString finish:^(UIImage *image) {
        
        //赋值操作
        self.image = image;
    }];
}
@end
