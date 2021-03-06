//
//  DetailTaskViewModel.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 30/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "DetailTaskViewModel.h"

@interface DetailTaskViewModel ()

@property id<DetailTaskPresenterProtocol> presenter;

@end

@implementation DetailTaskViewModel

- (instancetype)initWithPresenter:(id<DetailTaskPresenterProtocol>)presenter andTask:(Markdown*)task {
    self = [super init];
    if (self) {
        self.task = task;
        self.presenter = presenter;
    }
    return self;
}

- (void)showDetailTask {
    if(self.task==nil) {
        [self.presenter presentBlankState];
    }else{
        [self.presenter presentDetailsForTask];
    }
}

@end
