//
//  ZHTableViewCellProtocol.h
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZHTableViewCellProtocol <NSObject>
@required
- (void)updateWithData:(id)data;

@end
