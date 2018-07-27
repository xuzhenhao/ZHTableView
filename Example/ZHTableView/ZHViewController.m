//
//  ZHViewController.m
//  ZHTableView
//
//  Created by xuzhenhao on 07/27/2018.
//  Copyright (c) 2018 xuzhenhao. All rights reserved.
//

#import "ZHViewController.h"
#import "UITableView+ZHTableView.h"
#import "UIResponder+ZHRouter.h"

@interface ZHViewController ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *txtField;

@end

@implementation ZHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configTableView];
}
- (void)configTableView{
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
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    NSLog(@"事件名:%@ 值:%@",eventName,userInfo);
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZHTableViewItem *item = [self.tableView zh_itemAtIndexPath:indexPath];
    return item.height;
}



@end
