//
//  TaskGatewayDouble.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "TaskGatewayDouble.h"

@interface TaskGatewayDouble ()

@property (strong, nonatomic) NSMutableArray *listOftasks;

@end

@implementation TaskGatewayDouble

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.listOftasks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSMutableArray *)tasks {
    return self.listOftasks;
}

- (void)saveTask:(Markdown*)task {
    if([self.listOftasks containsObject:task]){
        //Same reference
    }else{
        [self.listOftasks addObject:task];
    }
}

@end
