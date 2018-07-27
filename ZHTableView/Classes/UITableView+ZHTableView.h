//
//  UITableView+ZHTableView.h
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHTableViewItem.h"
#import "ZHTableViewSection.h"
#import "ZHTableViewDataSource.h"
#import "ZHTableViewCellProtocol.h"

@interface UITableView (ZHTableView)

#pragma mark - 构造器

+ (instancetype)zh_tableViewWithFrame:(CGRect)frame
                                style:(UITableViewStyle)style
                           datasource:(ZHTableViewDataSource *)dataSource;
+ (instancetype)zh_tableViewWithFrame:(CGRect)frame
                                style:(UITableViewStyle)style;

#pragma mark - dataSource Delegate
- (void)zh_createDataSource;
- (void)zh_configDataSource:(ZHTableViewDataSource *)dataSource;

#pragma mark - section operation
- (void)zh_addSection:(ZHTableViewSection *)section;
- (void)zh_addSections:(NSArray<ZHTableViewSection *> *)sections;
- (void)zh_insertSection:(ZHTableViewSection *)section
              atIndex:(NSInteger)index;
- (void)zh_removeSectionAtIndex:(NSInteger)index;
- (void)zh_removeAllSections;
- (ZHTableViewSection *)zh_sectionAtIndex:(NSInteger)index;
- (NSArray<ZHTableViewSection *> *)zh_allSections;
- (NSInteger)zh_sectionsCount;

#pragma mark - item operation
- (void)zh_addItem:(ZHTableViewItem *)item
      atSection:(NSInteger)section;
- (void)zh_addItems:(NSArray<ZHTableViewItem *> *)items
       atSection:(NSInteger)section;
- (void)zh_insertItem:(ZHTableViewItem *)item
         atSection:(NSInteger)section
               row:(NSInteger)row;
- (void)zh_removeItemAtSection:(NSInteger)section
                        row:(NSInteger)row;
- (void)zh_removeAllItemsAtSection:(NSInteger)section;

- (ZHTableViewItem *)zh_itemAtIndexPath:(NSIndexPath *)indexPath;
- (ZHTableViewItem *)zh_itemAtSection:(NSInteger)section
                               row:(NSInteger)row;
- (NSArray<ZHTableViewItem *> *)zh_itemsAtSection:(NSInteger)section;
- (NSInteger)zh_itemsCountAtSection:(NSInteger)section;

@end
