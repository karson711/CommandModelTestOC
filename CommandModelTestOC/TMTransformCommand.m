//
//  TMTransformCommand.m
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import "TMTransformCommand.h"

@interface TMTransformCommand()

@property(nonatomic,strong)TetrisMachine *tm;

@end

@implementation TMTransformCommand

-(instancetype)init:(TetrisMachine *)tm{
    self = [super init];
    if (self) {
        self.tm = tm;
    }
    return self;
}

-(void)execute{
    [self.tm toTransform];
}

@end
