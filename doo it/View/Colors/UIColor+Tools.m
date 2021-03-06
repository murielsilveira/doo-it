//
//  UIColor+i7HexColor.m
//  
//
//  Created by Jonas Schnelli on 01.07.10.
//  Copyright 2010 include7 AG. All rights reserved.
//

#import "UIColor+Tools.h"


@implementation UIColor (Tools)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
	unsigned int colorValueR, colorValueG, colorValueB, colorValueA;
    
	NSString *hexStringCleared = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
	
    if(hexStringCleared.length == 3) {
		hexStringCleared = [NSString stringWithFormat:@"%@%@%@%@%@%@", [hexStringCleared substringWithRange:NSMakeRange(0, 1)],[hexStringCleared substringWithRange:NSMakeRange(0, 1)],
												[hexStringCleared substringWithRange:NSMakeRange(1, 1)],[hexStringCleared substringWithRange:NSMakeRange(1, 1)],
												[hexStringCleared substringWithRange:NSMakeRange(2, 1)],[hexStringCleared substringWithRange:NSMakeRange(2, 1)]];
	}
	
    if(hexStringCleared.length == 6) {
		hexStringCleared = [hexStringCleared stringByAppendingString:@"ff"];
	}
	
	NSString *red = [hexStringCleared substringWithRange:NSMakeRange(0, 2)];
	NSString *green = [hexStringCleared substringWithRange:NSMakeRange(2, 2)];
	NSString *blue = [hexStringCleared substringWithRange:NSMakeRange(4, 2)];
	NSString *alpha = [hexStringCleared substringWithRange:NSMakeRange(6, 2)];
	
	[[NSScanner scannerWithString:red] scanHexInt:&colorValueR];
	[[NSScanner scannerWithString:green] scanHexInt:&colorValueG];
	[[NSScanner scannerWithString:blue] scanHexInt:&colorValueB];
	[[NSScanner scannerWithString:alpha] scanHexInt:&colorValueA];
	
	return [UIColor colorWithRed:((colorValueR)&0xFF)/255.0 
					green:((colorValueG)&0xFF)/255.0 
					 blue:((colorValueB)&0xFF)/255.0 
					alpha:((colorValueA)&0xFF)/255.0];
}

- (NSString *)hexStringFromColor {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

- (UIColor *)brighterColorWithAmount:(CGFloat)amount {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    CGFloat r = components[0] + amount;
    CGFloat g = components[1] + amount;
    CGFloat b = components[2] + amount;
    
    return [UIColor colorWithRed:r  green:g blue:b alpha:1];
}

@end
