//
//  UIImageView+WebCache.h
//  模拟SD
//
//  Created by 曹魏 on 2017/11/23.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WebCache)
//分类中声明的属性不会生成setter,getter方法和成员变量
@property (nonatomic,copy)NSString *currentURL;
- (void)downloadWithUrlString:(NSString *)urlString;
@end
