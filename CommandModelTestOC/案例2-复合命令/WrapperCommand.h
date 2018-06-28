//
//  WrapperCommand.h
//  CommandModelTestOC
//
//  Created by kunge on 2018/6/28.
//  Copyright © 2018年 kunge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMCommandProtocol.h"

@interface WrapperCommand : NSObject<TMCommandProtocol>

- (instancetype)init:(NSMutableArray*)commands;

@end
