//
//  DynamicCommand.m
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "DynamicCommand.h"

@interface DynamicCommand()

@property(nonatomic,strong)TetrisMachine *tm;
@property(nonatomic,strong)DynamicBlock tmBlock;

@end

@implementation DynamicCommand

-(instancetype)init:(TetrisMachine *)tm tmBlock:(DynamicBlock)tmBlock{
    self = [super init];
    if (self) {
        self.tm = tm;
        self.tmBlock = tmBlock;
    }
    return self;
}

-(void)execute{
    self.tmBlock(self.tm);
}

//创建对象的时候由于有的时候初始化参数过于复杂，这个我们可以内部提供
//我的动态命令创建过程，专门有了实现，外部只需要调用即可
+(id<TMCommandProtocol>)creatCommand:(TetrisMachine *)tm tmBlock:(DynamicBlock)tmBlock{
    return [[DynamicCommand alloc]init:tm tmBlock:tmBlock];
}

@end
