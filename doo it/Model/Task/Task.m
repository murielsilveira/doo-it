//
//  Task.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.taskTitle = title;
    }
    return self;
}

@end
