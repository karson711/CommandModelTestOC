//
//  DynamicCommand.h
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TetrisMachine.h"
#import "TMCommandProtocol.h"

typedef void(^DynamicBlock)(TetrisMachine* tm);

@interface DynamicCommand : NSObject<TMCommandProtocol>

-(instancetype)init:(TetrisMachine *)tm tmBlock:(DynamicBlock)tmBlock;

+(id<TMCommandProtocol>)creatCommand:(TetrisMachine *)tm tmBlock:(DynamicBlock)tmBlock;

@end
