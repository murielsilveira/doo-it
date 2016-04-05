//
//  ColorView.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 04/04/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ColorView.h"
#import "UIColor+Tools.h"

@interface ColorView ()

@property NSString *color;
@property NSInteger position;

@end

@implementation ColorView

- (instancetype)initWithColor:(NSString*)color atPosition:(NSInteger)position {
    self = [super init];
    if (self) {
        self.color = color;
        self.position = position;
        [self initColorView];
    }
    return self;
}

- (void)initColorView {
    self.frame = CGRectMake(self.position * 40, 20, 40, 40);
    
    UIView *internalView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 30, 30)];
    internalView.layer.masksToBounds = YES;
    internalView.layer.cornerRadius = 15;
    internalView.backgroundColor = [UIColor colorWithHexString:self.color];
    [self addSubview:internalView];
    
    UIView *selectionIndicatorView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    selectionIndicatorView.backgroundColor = [UIColor whiteColor];
    selectionIndicatorView.layer.masksToBounds = YES;
    selectionIndicatorView.layer.cornerRadius = 5;
    
    [internalView addSubview:selectionIndicatorView];
}

@end
