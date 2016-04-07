//
//  Task.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Markdown : NSObject

@property NSInteger markdownID;
@property NSString *markdownString;
@property NSString *markdownColor;
@property NSDate *markdownCreation;
@property NSDate *markdownUpdate;
@property BOOL deleted;
@property BOOL archived;

- (NSString*)title;

@end
