//
//  WrapperCommand.m
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "WrapperCommand.h"

@interface WrapperCommand()
//父类引用指向子类实例对象（面向对象编程）->架构设计中以后经常看到->后面讲解的内容都将面向协议
@property(nonatomic, strong) NSMutableArray* commands;
@end

@implementation WrapperCommand

- (instancetype)init:(NSMutableArray*)commands{
    self = [super init];
    if (self) {
        self.commands = commands;
    }
    return self;
}

-(void)execute{
    for (id<TMCommandProtocol>command in self.commands) {
        [command execute];
    }
}

@end
