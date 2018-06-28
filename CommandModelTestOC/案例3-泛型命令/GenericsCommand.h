//
//  GenericsCommand.h
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommandProtocol.h"

//T：表示任意类型标记(表示符)->Type类型含义->T(ObjectType)
//框架设计中：存在多个泛型(代表有意义)-ObjectType(id)
@interface GenericsCommand<T> : NSObject<TMCommandProtocol>

- (instancetype)init:(T)receiver block:(void(^)(T))commandBlock;

//提供一个创建命令类方法
+(id<TMCommandProtocol>)createCommand:(T)receiver block:(void(^)(T))commandBlock;

@end
