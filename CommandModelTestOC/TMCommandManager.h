//
//  TMCommandManager.h
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TetrisMachine.h"
#import "TMLeftCommand.h"
#import "TMRightCommand.h"
#import "TMTransformCommand.h"

@interface TMCommandManager : NSObject

-(instancetype)init:(TetrisMachine *)tm left:(TMLeftCommand *)left right:(TMRightCommand *)right transform:(TMTransformCommand *)transform;

-(void)toLeft;
-(void)toRight;
-(void)toTransform;
-(void)undo;
-(void)undoAll;

@end
