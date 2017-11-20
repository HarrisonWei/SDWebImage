//
//  SDModel.h
//  模拟SD
//
//  Created by 曹魏 on 2017/11/20.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDModel : NSObject
@property (nonatomic,copy)NSString *icon;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
+ (NSArray <SDModel *> *)apps;
@end
