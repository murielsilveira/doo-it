//
//  TaskGatewayProtocol.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@protocol TaskGatewayProtocol <NSObject>

- (NSArray*)tasksFrom:(NSDate*)initialDate to:(NSDate*)finalDate;
- (int)numberOfTasksFrom:(NSDate*)initialDate to:(NSDate*)finalDate;
- (void)addTask:(Task*)task;

@end
