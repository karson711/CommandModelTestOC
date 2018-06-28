//
//  GenericsCommandManager.m
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "GenericsCommandManager.h"

#import "GenericsCommand.h"
#import "WrapperCommand.h"

@interface GenericsCommandManager()

@property(nonatomic, strong) NSMutableArray* commands;
@property(nonatomic, strong) TetrisMachine* tm;
@end

@implementation GenericsCommandManager

- (instancetype)init:(TetrisMachine*)tm{
    self = [super init];
    if (self) {
        self.tm = tm;
        self.commands = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)toLeft{
    [self addCommand:@"toLeft"];
    [self.tm toLeft];
}

-(void)toRight{
    [self addCommand:@"toRight"];
    [self.tm toRight];
}

-(void)toTransform{
    [self addCommand:@"toTransform"];
    [self.tm toTransform];
}

-(void)addCommand:(NSString*)methodName{
    //根据方法名称，动态加载执行对象的方法(runtime基础知识)
    //自己复习一下关于runtime基础知识
    //获取到方法对象
    SEL method = NSSelectorFromString(methodName);
    //添加动态命令
    [self.commands addObject:[[GenericsCommand alloc]init:self.tm block:^(TetrisMachine *tm) {
        //执行回调
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [tm performSelector:method];
#pragma clang diagnostic pop
    }]];
}

-(void)undo{
    //倒序(队列->自己设计)
    if (self.commands.count > 0) {
        NSLog(@"撤销如下：...");
        //撤销->DynamicCommand
        [[self.commands lastObject] execute];
        //移除
        [self.commands removeLastObject];
    }
}

-(void)undoAll{
    NSLog(@"撤销所有");
    //倒数删除->课后去实现（循环倒数删除）
    //协议规范写法->语法规范
    //复合命令调用
    WrapperCommand* command = [[WrapperCommand alloc] init:self.commands];
    [command execute];
    [self.commands removeAllObjects];
}

@end
