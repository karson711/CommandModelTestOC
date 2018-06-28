//
//  DynamicCommandManager.h
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TetrisMachine.h"

@interface DynamicCommandManager : NSObject

- (instancetype)init:(TetrisMachine*)tm;

-(void)toLeft;
-(void)toRight;
-(void)toTransform;
-(void)undo;
-(void)undoAll;

@end
