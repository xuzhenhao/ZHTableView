//
//  ZHTableViewItem.m
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import "ZHTableViewItem.h"

@implementation ZHTableViewItem

#pragma mark - 构造方法
+ (instancetype)itemWithData:(id)data reuserId:(NSString *)reuseId height:(CGFloat)height{
    ZHTableViewItem *item = [self new];
    item.data = data;
    item.reuseIdentifier = reuseId;
    item.height = height;
    
    return item;
}
@end
