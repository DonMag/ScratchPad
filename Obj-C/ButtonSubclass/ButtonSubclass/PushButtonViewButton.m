//
//  PushButtonViewButton.m
//  ButtonSubclass
//
//  Created by Don Mag on 3/15/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "PushButtonViewButton.h"

@interface PushButtonViewButton ()

@property (strong, nonatomic) IBInspectable UIColor *normalColor;
@property (strong, nonatomic) IBInspectable UIColor *highlightColor;

@end

@implementation PushButtonViewButton

UIColor *cColor;

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	
	if (self) {
		[self commonInit];
	}
	
	return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
	// Call the parent implementation of initWithCoder
	self = [super initWithCoder:coder];
	
	// Custom drawing methods
	if (self) {
		[self commonInit];
	}
	
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self commonInit]; // Run time, loading from xib.
}

- (void)commonInit {

	if (!_normalColor) {
		_normalColor = [UIColor redColor];
	}
	if (!_highlightColor) {
		_highlightColor = [UIColor yellowColor];
	}
	
}

- (void)setNormalColor:(UIColor *)nColor {
	if (nColor != _normalColor) {
		_normalColor = nColor;
	}
}

- (void)setHighlightColor:(UIColor *)nColor {
	if (nColor != _highlightColor) {
		_highlightColor = nColor;
	}
}

- (void)drawRect:(CGRect)rect {
    // Drawing code

	CGFloat xc = self.bounds.size.width / 2;
	CGFloat yc = self.bounds.size.height / 2;
	
	CGFloat xoff = xc * 0.1;
	CGFloat yoff = yc * 0.1;
	
	UIBezierPath *pth;
	
	pth = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:MIN(xc, yc)];

	if (self.isHighlighted) {
		[_highlightColor setFill];
	} else {
		[_normalColor setFill];
	}
	
	[pth fill];
	
	pth = [[UIBezierPath alloc] init];
	
	pth.lineWidth = 2.0;
	
	[pth moveToPoint:CGPointMake(xoff, yc)];
	[pth addLineToPoint:CGPointMake(xc, yoff)];
	[pth addLineToPoint:CGPointMake(self.bounds.size.width - xoff, yc)];
	[pth addLineToPoint:CGPointMake(xc, self.bounds.size.height - yoff)];
	[pth closePath];
	
	[[UIColor whiteColor] setStroke];
	
	[pth stroke];
	
}

- (void)setHighlighted:(BOOL)highlighted {
	[self setNeedsDisplay];
	[super setHighlighted:highlighted];
}

@end
