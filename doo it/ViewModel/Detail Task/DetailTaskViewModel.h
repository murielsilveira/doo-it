//
//  DetailTaskViewModel.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 30/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailTaskPresenterProtocol.h"
#import "Markdown.h"

@interface DetailTaskViewModel : NSObject

@property Markdown *task;
- (instancetype)initWithPresenter:(id<DetailTaskPresenterProtocol>)presenter andTask:(Markdown*)task;
- (void)showDetailTask;

@end
