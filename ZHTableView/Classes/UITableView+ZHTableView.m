//
//  UITableView+ZHTableView.m
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import "UITableView+ZHTableView.h"
#import <objc/runtime.h>

static void * zhTableViewDataSourceKey = @"zhTableViewDataSourceKey";

@interface UITableView()

/** 数据源关联对象*/
@property (nonatomic, strong)   ZHTableViewDataSource     *zhDataSource;

@end


@implementation UITableView (ZHTableView)

#pragma mark - 构造器

+ (instancetype)zh_tableViewWithFrame:(CGRect)frame
                                style:(UITableViewStyle)style
                           datasource:(ZHTableViewDataSource *)dataSource{
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    if (dataSource) {
        [tableView zh_configDataSource:dataSource];
    }else{
        [tableView zh_createDataSource];
    }
    
    return tableView;
}
+ (instancetype)zh_tableViewWithFrame:(CGRect)frame
                                style:(UITableViewStyle)style{
    return [UITableView zh_tableViewWithFrame:frame style:style datasource:nil];
}

#pragma mark - 数据源
- (void)zh_createDataSource{
    ZHTableViewDataSource *dataSource = [ZHTableViewDataSource new];
    [self zh_configDataSource:dataSource];
}
- (void)zh_configDataSource:(ZHTableViewDataSource *)dataSource{
    self.zhDataSource = dataSource;
}

#pragma mark - section operation
- (void)zh_addSection:(ZHTableViewSection *)section{
    [self.zhDataSource addSection:section];
}
- (void)zh_addSections:(NSArray<ZHTableViewSection *> *)sections{
    [self.zhDataSource addSections:sections];
}
- (void)zh_insertSection:(ZHTableViewSection *)section
                 atIndex:(NSInteger)index{
    [self.zhDataSource insertSection:section atIndex:index];
}
- (void)zh_removeSectionAtIndex:(NSInteger)index{
    [self.zhDataSource removeSectionAtIndex:index];
}
- (void)zh_removeAllSections{
    [self.zhDataSource removeAllSections];
}
- (ZHTableViewSection *)zh_sectionAtIndex:(NSInteger)index{
    return [self.zhDataSource sectionAtIndex:index];
}
- (NSArray<ZHTableViewSection *> *)zh_allSections{
    return [self.zhDataSource allSections];
}
- (NSInteger)zh_sectionsCount{
    return [self.zhDataSource sectionsCount];
}

#pragma mark - item operation
- (void)zh_addItem:(ZHTableViewItem *)item
         atSection:(NSInteger)section{
    [self.zhDataSource addItem:item atSection:section];
}
- (void)zh_addItems:(NSArray<ZHTableViewItem *> *)items
          atSection:(NSInteger)section{
    [self.zhDataSource addItems:items atSection:section];
}
- (void)zh_insertItem:(ZHTableViewItem *)item
            atSection:(NSInteger)section
                  row:(NSInteger)row{
    [self.zhDataSource insertItem:item atSection:section row:row];
}
- (void)zh_removeItemAtSection:(NSInteger)section
                           row:(NSInteger)row{
    [self.zhDataSource removeItemAtSection:section row:row];
}
- (void)zh_removeAllItemsAtSection:(NSInteger)section{
    [self.zhDataSource removeAllItemsAtSection:section];
}

- (ZHTableViewItem *)zh_itemAtIndexPath:(NSIndexPath *)indexPath{
    return [self.zhDataSource itemAtIndexPath:indexPath];
}
- (ZHTableViewItem *)zh_itemAtSection:(NSInteger)section
                                  row:(NSInteger)row{
    return [self.zhDataSource itemAtSection:section row:row];
}
- (NSArray<ZHTableViewItem *> *)zh_itemsAtSection:(NSInteger)section{
    return [self.zhDataSource itemsAtSection:section];
}
- (NSInteger)zh_itemsCountAtSection:(NSInteger)section{
    return [self.zhDataSource itemsCountAtSection:section];
}

#pragma mark - setter&getter
- (void)setZhDataSource:(ZHTableViewDataSource *)zhDataSource{
    objc_setAssociatedObject(self, &zhTableViewDataSourceKey, zhDataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //把关联对象设为tableView的数据源
    self.dataSource = zhDataSource;
}
- (ZHTableViewDataSource *)zhDataSource{
    return objc_getAssociatedObject(self, &zhTableViewDataSourceKey);
}

@end
