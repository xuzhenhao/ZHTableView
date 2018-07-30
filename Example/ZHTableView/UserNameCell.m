//
//  UserNameCell.m
//  ZHTableView_Example
//
//  Created by xuzhenhao on 2018/7/27.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import "UserNameCell.h"
#import "ZHTableViewCellProtocol.h"
#import "UIResponder+ZHRouter.h"

NSString *userNameBeginEdit = @"userNameBeginEdit";
NSString *userNameDidChanged = @"userNameDidChanged";

@interface UserNameCell()<ZHTableViewCellProtocol>

@property (weak, nonatomic) IBOutlet UITextField *txtField;

@end

@implementation UserNameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)editingDidBegin:(UITextField *)sender {
    [self routerEventWithName:userNameBeginEdit userInfo:nil];
}

- (IBAction)editingDidChanged:(UITextField *)sender {
    [self routerEventWithName:userNameDidChanged userInfo:@{@"value":sender.text}];
}


- (void)updateWithData:(id)data{
    NSString *text = [NSString stringWithFormat:@"%@",data];
    self.txtField.text = text;
}

@end
