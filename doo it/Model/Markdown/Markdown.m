//
//  Task.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "Markdown.h"

@implementation Markdown

- (instancetype)init {
    self = [super init];
    if (self) {
        self.markdownString = @"#Header 1\n##Header 2\n###Header 3\n####Header 4\n#####Header 5\n######Header 6\nParagraph *italic* **bold**";
    }
    return self;
}

- (NSString*)title {
    NSString *title = [self.markdownString componentsSeparatedByString:@"\n"][0];
    title = [title stringByReplacingOccurrencesOfString:@"#" withString:@""];
    return title;
}

@end
