//
//  TMRightCommand.h
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommandProtocol.h"
#import "TetrisMachine.h"

@interface TMRightCommand : NSObject<TMCommandProtocol>

-(instancetype)init:(TetrisMachine *)tm;

@end
