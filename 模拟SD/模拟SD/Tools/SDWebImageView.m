//
//  SDWebImageView.m
//  模拟SD
//
//  Created by 曹魏 on 2017/11/22.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "SDWebImageView.h"
#import "SDDownloadManager.h"
@interface SDWebImageView()
@property (nonatomic,copy)NSString *currentURL;
@end
@implementation SDWebImageView

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
