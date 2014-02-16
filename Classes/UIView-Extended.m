//
//  UIView-Extended.m
//  AdventureUrban
//
//  Created by User on 11/28/10.
//  Copyright 2010 Assentec. All rights reserved.
//

#import "UIView-Extended.h"


@implementation UILabel (VerticalAlign)
- (void)alignTop
{
    CGSize fontSize = [self.text sizeWithFont:self.font];
	
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
	
	
    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
	
	
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
	
    for(int i=1; i< newLinesToPad; i++)
    {
        self.text = [self.text stringByAppendingString:@"\n"];
    }
}

- (void)alignBottom
{
    CGSize fontSize = [self.text sizeWithFont:self.font];
	
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
	
	
    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
	
	
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
	
    for(int i=1; i< newLinesToPad; i++)
    {
        self.text = [NSString stringWithFormat:@"\n%@",self.text];
    }
}
@end