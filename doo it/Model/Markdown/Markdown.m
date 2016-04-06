//
//  Task.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "Markdown.h"

@implementation Markdown

- (instancetype)initWithTitle {
    self = [super init];
    if (self) {
        self.markdownString = @"#New Markdown\n\n#Header 1\n##Header2";
    }
    return self;
}

@end
