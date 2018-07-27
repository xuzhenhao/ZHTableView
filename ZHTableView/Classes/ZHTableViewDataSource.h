//
//  ZHTableViewDataSource.h
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHTableViewSection.h"

@interface ZHTableViewDataSource : NSObject<UITableViewDataSource>

#pragma mark - section operation
- (void)addSection:(ZHTableViewSection *)section;
- (void)addSections:(NSArray<ZHTableViewSection *> *)sections;
- (void)insertSection:(ZHTableViewSection *)section
              atIndex:(NSInteger)index;
- (void)removeSectionAtIndex:(NSInteger)index;
- (void)removeAllSections;
- (ZHTableViewSection *)sectionAtIndex:(NSInteger)index;
- (NSArray<ZHTableViewSection *> *)allSections;
- (NSInteger)sectionsCount;

#pragma mark - item operation
- (void)addItem:(ZHTableViewItem *)item
      atSection:(NSInteger)section;
- (void)addItems:(NSArray<ZHTableViewItem *> *)items
       atSection:(NSInteger)section;
- (void)insertItem:(ZHTableViewItem *)item
         atSection:(NSInteger)section
               row:(NSInteger)row;
- (void)removeItemAtSection:(NSInteger)section
                        row:(NSInteger)row;
- (void)removeAllItemsAtSection:(NSInteger)section;

- (ZHTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath;
- (ZHTableViewItem *)itemAtSection:(NSInteger)section
                               row:(NSInteger)row;
- (NSArray<ZHTableViewItem *> *)itemsAtSection:(NSInteger)section;
- (NSInteger)itemsCountAtSection:(NSInteger)section;

@end
