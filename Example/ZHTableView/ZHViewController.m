//
//  ZHViewController.m
//  ZHTableView
//
//  Created by xuzhenhao on 07/27/2018.
//  Copyright (c) 2018 xuzhenhao. All rights reserved.
//

#import "ZHViewController.h"
#import "UITableView+ZHTableView.h"
#import "UserNameCell.h"
#import "UIResponder+ZHRouter.h"

@interface ZHViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *txtField;

@property (nonatomic, strong)   NSDictionary     *eventStrategy;

@end

@implementation ZHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configTableView];
}
#pragma mark - UIConfig
- (void)configTableView{
    self.tableView.delegate = self;
    [self.tableView zh_createDataSource];
    ZHTableViewSection *section = [ZHTableViewSection new];
    NSArray *items = @[
                       [ZHTableViewItem itemWithData:@"bannerModel" reuserId:@"bannerCell" height:60],
                       [ZHTableViewItem itemWithData:@"a tableView demo" reuserId:@"userNameCell" height:60],
                       ];
    [section addItems:items];
    [self.tableView zh_addSection:section];
    [self.tableView reloadData];
}
#pragma mark - event handler
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    NSString *event = self.eventStrategy[eventName];
    
    [self performSelector:NSSelectorFromString(event) withObject:userInfo];
    
}
- (void)didUserNameBeginEdit:(NSDictionary *)info{
    NSLog(@"开始输入回调: 值:%@",info);
}
- (void)didUserNameChanged:(NSDictionary *)info{
    NSLog(@"数值改变回调 值:%@",info);
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZHTableViewItem *item = [self.tableView zh_itemAtIndexPath:indexPath];
    return item.height;
}

#pragma mark - setter&getter
- (NSDictionary *)eventStrategy{
    if (_eventStrategy == nil) {
        _eventStrategy = @{
                           userNameBeginEdit:@"didUserNameBeginEdit:",
                           userNameDidChanged:@"didUserNameChanged:"
                           };
    }
    return _eventStrategy;
}

@end
