//
//  ZHTableViewSection.h
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHTableViewItem.h"

/**
 Section的抽象数据模型
 */
@interface ZHTableViewSection : NSObject
/** 是否隐藏section*/
@property (nonatomic, assign,getter=isHidden)   BOOL      hidden;

#pragma mark - item operations

- (void)addItem:(ZHTableViewItem *)item;
- (void)addItems:(NSArray<ZHTableViewItem *> *)items;
- (void)insertItem:(ZHTableViewItem *)item
           atIndex:(NSInteger)index;
- (void)removeItemAtIndex:(NSInteger)index;
- (void)removeAllItems;

- (ZHTableViewItem *)itemAtIndex:(NSInteger)index;
- (NSArray<ZHTableViewItem *> *)allItems;
- (NSInteger)itemCounts;

@end
