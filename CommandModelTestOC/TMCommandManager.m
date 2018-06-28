//
//  TMCommandManager.m
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "TMCommandManager.h"

@interface TMCommandManager()

@property(nonatomic,strong)TetrisMachine *tm;
@property(nonatomic,strong)TMLeftCommand *left;
@property(nonatomic,strong)TMRightCommand *right;
@property(nonatomic,strong)TMTransformCommand *transform;
@property(nonatomic,strong)NSMutableArray *commands;

@end

@implementation TMCommandManager

-(instancetype)init:(TetrisMachine *)tm left:(TMLeftCommand *)left right:(TMRightCommand *)right transform:(TMTransformCommand *)transform{
    self = [super init];
    if (self) {
        self.commands = [NSMutableArray array];
        self.tm = tm;
        self.left = left;
        self.right = right;
        self.transform = transform;
    }
    return self;
}

-(void)toLeft{
    [self.left execute];
    
    [self.commands addObject:[[TMLeftCommand alloc]init:self.tm]];
}

-(void)toRight{
    [self.right execute];
    
    [self.commands addObject:[[TMRightCommand alloc]init:self.tm]];
}

-(void)toTransform{
    [self.transform execute];
    
    [self.commands addObject:[[TMTransformCommand alloc]init:self.tm]];
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
