//
//  TaskGatewayFactory.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 30/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "MarkdownGatewayFactory.h"
#import "Colors.h"
#import "UIColor+Tools.h"

@implementation MarkdownGatewayFactory

+ (void)injectRandomObjects:(TaskGatewayDouble *)_sharedInstance {
    Markdown *task = [[Markdown alloc]init];
    task.markdownColor = [[Colors deepOrange] hexStringFromColor];
    task.markdownString = @"#Open a hotel in Amsterdam\n###or maybe Barcelona.";
    [_sharedInstance saveTask:task];
    task = [[Markdown alloc]init];
    task.markdownColor = [[Colors lightBlue] hexStringFromColor];
    task.markdownString = @"#Create an app for selling interplanetary trips tickets\nCredit Card required!";
    [_sharedInstance saveTask:task];
    task = [[Markdown alloc]init];
    task.markdownColor = [[Colors amber] hexStringFromColor];
    task.markdownString = @"#Write a book about Supermassive Black Holes";
    [_sharedInstance saveTask:task];
    task = [[Markdown alloc] init];
    task.markdownColor = [[Colors deepOrange] hexStringFromColor];
    [_sharedInstance saveTask:task];
}

+ (id<MarkdownGatewayProtocol>)create {
    static TaskGatewayDouble *_sharedInstance;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[TaskGatewayDouble alloc] init];
        [self injectRandomObjects:_sharedInstance];
    });
    
    return _sharedInstance;
}

@end
