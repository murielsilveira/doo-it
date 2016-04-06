//
//  ListTasksViewModel.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListTasksPresenterProtocol.h"
#import "MarkdownGatewayProtocol.h"
#import "DetailTaskPresenterProtocol.h"

@interface ListTasksViewModel : NSObject

- (instancetype)initWithPresenter:(id<ListTasksPresenterProtocol>)presenter andGateway:(id<MarkdownGatewayProtocol>)taskGateway;

- (void)presentListOfTasks;
- (NSInteger)numberOfTasksToPresent;
- (Markdown*)taskForRowAtIndex:(NSInteger)index;

@end
