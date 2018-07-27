//
//  UIResponder+ZHRouter.h
//  ZHRemember
//
//  Created by xuzhenhao on 2018/7/26.
//  Copyright © 2018年 xuzhenhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (ZHRouter)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
