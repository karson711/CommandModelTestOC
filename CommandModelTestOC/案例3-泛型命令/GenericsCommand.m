//
//  GenericsCommand.m
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "GenericsCommand.h"

@interface GenericsCommand<T>()

//父类引用指向子类实例对象（面向对象编程）->架构设计中以后经常看到->后面讲解的内容都将面向协议
@property(nonatomic, strong) T receiver;
@property(nonatomic, strong) void(^commandBlock)(T);

@end

@implementation GenericsCommand

-(instancetype)init:(id)reciver block:(void(^)(id))commandBlock{
    self = [super init];
    if (self) {
        self.receiver = reciver;
        self.commandBlock = commandBlock;
    }
    return self;
}

-(void)execute{
    self.commandBlock(self.receiver);
}

+(id<TMCommandProtocol>)createCommand:(id)receiver block:(void (^)(id))commandBlock{
    return [[GenericsCommand alloc] init:receiver block:commandBlock];
}

@end
