//
//  ZHTableViewDataSource.m
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import "ZHTableViewDataSource.h"
#import "ZHTableViewSection.h"
#import "ZHTableViewCellProtocol.h"

@interface ZHTableViewDataSource()

/** 数据源*/
@property (nonatomic, strong)   NSMutableArray<ZHTableViewSection *>     *sections;

@end

@implementation ZHTableViewDataSource


#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ZHTableViewSection *sectionData = self.sections[section];
    
    NSInteger rowCount =  sectionData.isHidden ? 0 : [sectionData itemCounts];
    return rowCount;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZHTableViewItem *item = [self itemAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.reuseIdentifier forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(updateWithData:)]) {
        [cell performSelector:@selector(updateWithData:) withObject:item.data];
    }
    
    return cell;
}

#pragma mark - section operation
- (void)addSection:(ZHTableViewSection *)section{
    if (!section) {
        return;
    }
    [self.sections addObject:section];
}
- (void)addSections:(NSArray<ZHTableViewSection *> *)sections{
    if (!sections) {
        return;
    }
    
    [self.sections addObjectsFromArray:sections];
}
- (void)insertSection:(ZHTableViewSection *)section
              atIndex:(NSInteger)index{
    if (!section || self.sections.count < index) {
        return;
    }
    
    [self.sections insertObject:section atIndex:index];
}
- (void)removeSectionAtIndex:(NSInteger)index{
    if (self.sections.count <= index) {
        return;
    }
    
    [self.sections removeObjectAtIndex:index];
}
- (void)removeAllSections{
    [self.sections removeAllObjects];
}
- (ZHTableViewSection *)sectionAtIndex:(NSInteger)index{
    if (self.sections.count <= index) {
        return nil;
    }
    
    return self.sections[index];
}
- (NSArray<ZHTableViewSection *> *)allSections{
    return self.sections;
}
- (NSInteger)sectionsCount{
    return self.sections.count;
}

#pragma mark - item operation

- (void)addItem:(ZHTableViewItem *)item
      atSection:(NSInteger)section{
    if (self.sections.count <= section) {
        return;
    }
    
    [self.sections[section] addItem:item];
}
- (void)addItems:(NSArray<ZHTableViewItem *> *)items
       atSection:(NSInteger)section{
    if (self.sections.count <= section) {
        return;
    }
    
    [self.sections[section] addItems:items];
}
- (void)insertItem:(ZHTableViewItem *)item
         atSection:(NSInteger)section
               row:(NSInteger)row{
    if (self.sections.count <= section) {
        return;
    }
    [self.sections[section] insertItem:item atIndex:row];
    
}
- (void)removeItemAtSection:(NSInteger)section
                        row:(NSInteger)row{
    if (self.sections.count <= section) {
        return;
    }
    
    [self.sections[section] removeItemAtIndex:row];
}
- (void)removeAllItemsAtSection:(NSInteger)section{
    if (self.sections.count <= section) {
        return;
    }
    [self.sections[section] removeAllItems];
}

- (ZHTableViewItem *)itemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.sections.count <= indexPath.section) {
        return nil;
    }
    
    return [self.sections[indexPath.section] itemAtIndex:indexPath.row];
}
- (ZHTableViewItem *)itemAtSection:(NSInteger)section
                               row:(NSInteger)row{
    if (self.sections.count <= section) {
        return nil;
    }
    
    return [self.sections[section] itemAtIndex:row];
}
- (NSArray<ZHTableViewItem *> *)itemsAtSection:(NSInteger)section{
    if (self.sections.count <= section) {
        return nil;
    }
    
    return [self.sections[section] allItems];
}
- (NSInteger)itemsCountAtSection:(NSInteger)section{
    if (self.sections.count <= section) {
        return 0;
    }
    
    return [self.sections[section] itemCounts];
}

#pragma mark - getter
- (NSMutableArray<ZHTableViewSection *> *)sections{
    if (!_sections) {
        _sections = [NSMutableArray array];
    }
    return _sections;
}
@end
