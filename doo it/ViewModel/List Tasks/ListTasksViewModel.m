//
//  ListTasksViewModel.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListTasksViewModel.h"

@interface ListTasksViewModel ()

@property id<ListTasksPresenterProtocol> presenter;
@property id<MarkdownGatewayProtocol> taskGateway;
@property NSArray *listOfTasks;

@end

@implementation ListTasksViewModel

- (instancetype)initWithPresenter:(id<ListTasksPresenterProtocol>)presenter andGateway:(id<MarkdownGatewayProtocol>)taskGateway {
    self = [super init];
    if (self) {
        self.presenter = presenter;
        self.taskGateway = taskGateway;
    }
    return self;
}

-(void) presentListOfTasks {
    self.listOfTasks = [self.taskGateway tasks];
    if(self.listOfTasks.count == 0) {
        [self.presenter presentBlankState];
    }else{
        [self.presenter presentListOfTasks];
    }
}

- (NSInteger)numberOfTasksToPresent {
    return self.listOfTasks.count;
}

- (Markdown*)taskForRowAtIndex:(NSInteger)index {
    return self.listOfTasks[index];
}

@end
