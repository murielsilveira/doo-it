//
//  UIColor+i7HexColor.h
//  
//
//  Created by Jonas Schnelli on 01.07.10.
//  Copyright 2010 include7 AG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Tools)

+ (UIColor *)colorWithHexString:(NSString *)hexString;
- (NSString *)hexStringFromColor;
- (UIColor *)brighterColorWithAmount:(CGFloat)amount;

@end
