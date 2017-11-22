//
//  SDWebImageView.h
//  模拟SD
//
//  Created by 曹魏 on 2017/11/22.
//  Copyright © 2017年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDWebImageView : UIImageView
- (void)downloadWithUrlString:(NSString *)urlString;
@end
