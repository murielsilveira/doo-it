//
//  TaskGateway.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TaskGateway <NSObject>

- (NSArray)tasksFrom(NSDate)initialDate until:(NSDate)finalDate;

@end
