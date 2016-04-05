//
//  TaskGatewayProtocol.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Markdown.h"

@protocol MarkdownGatewayProtocol <NSObject>

- (NSArray*)tasks;
- (void)saveTask:(Markdown*)task;

@end
