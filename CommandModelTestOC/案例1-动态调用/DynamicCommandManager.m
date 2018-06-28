//
//  DynamicCommandManager.m
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "DynamicCommandManager.h"
#import "DynamicCommand.h"

@interface DynamicCommandManager()

@property(nonatomic,strong)TetrisMachine *tm;
@property(nonatomic,strong)NSMutableArray *commands;

@end

@implementation DynamicCommandManager

-(instancetype)init:(TetrisMachine *)tm{
    self = [super init];
    if (self) {
        self.commands = [NSMutableArray array];
        self.tm = tm;
    }
    return self;
}

-(void)addCommandWith:(NSString *)methodName{
    //获取到方法对象
    SEL method = NSSelectorFromString(methodName);
    //添加动态命令
    [self.commands addObject:[[DynamicCommand alloc]init:self.tm tmBlock:^(TetrisMachine *tm) {
        //执行回调
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [tm performSelector:method];
        #pragma clang diagnostic pop
    }]];
}

-(void)toLeft{
    [self addCommandWith:@"toLeft"];
    [self.tm toLeft];
    
}

-(void)toRight{
    [self addCommandWith:@"toRight"];
    [self.tm toRight];
}

-(void)toTransform{
    [self addCommandWith:@"toTransform"];
    [self.tm toTransform];
}

-(void)undo{
    if (self.commands.count > 0) {
        [[self.commands lastObject] execute];
        [self.commands removeLastObject];
    }
}

//撤销所有
-(void)undoAll{
    NSLog(@"撤销所有");
    //倒数删除->课后去实现（循环倒数删除）
    //协议规范写法->语法规范
    for (id<TMCommandProtocol> command in self.commands) {
        [command execute];
    }
    [self.commands removeAllObjects];
}


@end
