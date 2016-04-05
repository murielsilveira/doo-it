//
//  Task.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

- (instancetype)initWithTitle:(NSString *)title;

@property NSString *taskTitle;
@property NSString *taskDescription;
@property NSString *color;
@property NSDate *taskTime;
@property BOOL deleted;
@property BOOL done;

@end
