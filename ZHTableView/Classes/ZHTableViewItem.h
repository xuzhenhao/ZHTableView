//
//  ZHTableViewItem.h
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Row的抽象数据源
 */
@interface ZHTableViewItem : NSObject
/** cell属性对象，一般为网络请求回的数据模型*/
@property (nonatomic, strong)   id     data;
/** 重用标识符*/
@property (nonatomic, copy)     NSString    *reuseIdentifier;
/** cell类名*/
@property (nonatomic, copy)     NSString    *className;
/** cell高度*/
@property (nonatomic, assign)   CGFloat      height;

#pragma mark - 构造方法
+ (instancetype)itemWithData:(id)data reuserId:(NSString *)reuseId height:(CGFloat)height;

@end
