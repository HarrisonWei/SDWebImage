//
//  SDModel.m
//  模拟SD
//
//  Created by 曹魏 on 2017/11/20.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import "SDModel.h"

@implementation SDModel
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    id sdModel = [[self alloc]init];
    [sdModel setValuesForKeysWithDictionary:dict];
    return sdModel;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+ (NSArray <SDModel *> *)apps{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"apps.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *nmArray = [NSMutableArray array];
    //遍历数组字典转模型
    for (NSDictionary *dict in array) {
        SDModel *model = [SDModel modelWithDict:dict];
        [nmArray addObject:model];
    }
    return nmArray.copy;
}

@end
