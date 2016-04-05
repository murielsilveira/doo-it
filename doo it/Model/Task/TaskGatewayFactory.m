//
//  TaskGatewayFactory.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 30/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "TaskGatewayFactory.h"
#import "Colors.h"
#import "UIColor+Tools.h"

@implementation TaskGatewayFactory

+ (void)injectRandomObjects:(TaskGatewayDouble *)_sharedInstance {
    Task *task = [[Task alloc]initWithTitle:@"Open a hotel in Amsterdam"];
    task.color = [UIColor hexStringFromColor:[Colors deepOrange]];
    [_sharedInstance saveTask:task];
    task = [[Task alloc]initWithTitle:@"Create an app for selling interplanetary trips tickets"];
    task.color = [UIColor hexStringFromColor:[Colors amber]];
    [_sharedInstance saveTask:task];
    task = [[Task alloc]initWithTitle:@"Enjoy ceviche in Peru"];
    task.color = [UIColor hexStringFromColor:[Colors lightBlue]];
    [_sharedInstance saveTask:task];
    task = [[Task alloc]initWithTitle:@"Write a book about Supermassive Black Holes"];
    task.color = [UIColor hexStringFromColor:[Colors ironSky]];
    [_sharedInstance saveTask:task];
}

+ (id<TaskGatewayProtocol>)create {
    static TaskGatewayDouble *_sharedInstance;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[TaskGatewayDouble alloc] init];
        [self injectRandomObjects:_sharedInstance];
    });
    
    return _sharedInstance;
}

@end
