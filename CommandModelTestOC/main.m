//
//  main.m
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TetrisMachine.h"
#import "TMCommandManager.h"
#import "DynamicCommand.h"
#import "DynamicCommandManager.h"
#import "WrapperCommand.h"
#import "WrapperCommandManager.h"
#import "GenericsCommandManager.h"
#import "QueueCommandMananger.h"
#import "BlockCommandManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        TetrisMachine *tm = [[TetrisMachine alloc] init];
//        [tm toLeft];
//        [tm toRight];
//        [tm toTransform];
        
//        TMLeftCommand *left = [[TMLeftCommand alloc] init:tm];
//        TMRightCommand *right = [[TMRightCommand alloc] init:tm];
//        TMTransformCommand *transform = [[TMTransformCommand alloc] init:tm];
//        
//        TMCommandManager *manager = [[TMCommandManager alloc] init:tm left:left right:right transform:transform];
//        [manager toLeft];
//        [manager toRight];
//        [manager toTransform];
//        [manager undo];
        
        
        //案例1
//        DynamicCommandManager *manager = [[DynamicCommandManager alloc] init:tm];
//        [manager toLeft];
//        [manager toRight];
//        [manager toTransform];
//        [manager undo];
        
        //案例2
//        TMLeftCommand *left = [[TMLeftCommand alloc] init:tm];
//        TMRightCommand *right = [[TMRightCommand alloc] init:tm];
//        NSMutableArray *commands = [NSMutableArray arrayWithArray:@[left,right]];
//        WrapperCommand *wrapperCommand = [[WrapperCommand alloc] init:commands];
//        [wrapperCommand execute];
//        WrapperCommandManager *manager = [[WrapperCommandManager alloc] init:tm];
//        [manager toLeft];
//        [manager toRight];
//        [manager toTransform];
//        [manager undo];
        
        //案例3
//        GenericsCommandManager *manager = [[GenericsCommandManager alloc] init:tm];
//        [manager toLeft];
//        [manager toRight];
//        [manager toTransform];
//        [manager undo];
        
        //案例4
//        QueueCommandMananger *manager = [[QueueCommandMananger alloc] init:tm];
//        [manager toLeft];
//        [manager toRight];
//        [manager toTransform];
//        [manager undo];
        
        //案例5
        BlockCommandManager *manager = [[BlockCommandManager alloc] init:tm];
        [manager toLeft];
        [manager toRight];
        [manager toTransform];
        [manager undo];
        
    }
    return 0;
}
