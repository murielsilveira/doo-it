//
//  TaskGatewayFactory.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 30/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskGatewayProtocol.h"
#import "TaskGatewayDouble.h"

@interface TaskGatewayFactory : NSObject

+ (id<TaskGatewayProtocol>)create;

@end
