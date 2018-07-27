//
//  ZHTableViewSection.m
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import "ZHTableViewSection.h"

@interface ZHTableViewSection()

/** section的行数据源*/
@property (nonatomic, strong)   NSMutableArray<ZHTableViewItem *>     *items;

@end

@implementation ZHTableViewSection


#pragma mark - item operations

- (void)addItem:(ZHTableViewItem *)item{
    if (!item) {
        return;
    }
    [self.items addObject:item];
}

- (void)addItems:(NSArray<ZHTableViewItem *> *)items{
    if (items.count < 1) {
        return;
    }
    [self.items addObjectsFromArray:items];
}
- (void)insertItem:(ZHTableViewItem *)item
           atIndex:(NSInteger)index{
    if (!item || self.items.count < index) {
        return;
    }
    
    [self.items insertObject:item atIndex:index];
}
- (void)removeItemAtIndex:(NSInteger)index{
    if (self.items.count <= index) {
        return;
    }
    
    [self.items removeObjectAtIndex:index];
}
- (void)removeAllItems{
    [self.items removeAllObjects];
}

- (ZHTableViewItem *)itemAtIndex:(NSInteger)index{
    if (self.items.count <= index) {
        return nil;
    }
    
    return self.items[index];
}
- (NSArray<ZHTableViewItem *> *)allItems{
    return self.items;
}
- (NSInteger)itemCounts{
    return self.items.count;
}

#pragma mark - getter
- (NSMutableArray<ZHTableViewItem *> *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end
