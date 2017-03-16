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
	self = [super initWithCoder:coder];
	
	if (self) {
		[self commonInit];
	}
	
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	[self commonInit];
}

- (void)prepareForInterfaceBuilder {
	[self commonInit];
}

- (void)commonInit {

	if (!_normalColor) {
		_normalColor = [UIColor redColor];
	}
	if (!_highlightColor) {
		_highlightColor = [UIColor yellowColor];
	}

	// make sure background is clear, or we see a bounding box
	self.backgroundColor = [UIColor clearColor];
	
//	self.layer.cornerRadius = MIN(self.frame.size.height, self.frame.size.width) / 2.0;
//	self.clipsToBounds = YES;

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
	
	[super drawRect:rect];

	CGFloat halfW = rect.size.width / 2;
	CGFloat halfH = rect.size.height / 2;
	
	UIBezierPath *pth;
	
	// rounded corners... if the rect is 1:1 ratio, you'll get a circle
	pth = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:MIN(halfW, halfH)];

	if (self.isHighlighted) {
		[_highlightColor setFill];
	} else {
		[_normalColor setFill];
	}
	
	[pth fill];
	
	// draw a diamond shape inside the rounded rect, just to demonstrate a little additional drawing
	CGFloat xoff = halfW * 0.1;
	CGFloat yoff = halfH * 0.1;
	
	pth = [[UIBezierPath alloc] init];
	
	pth.lineWidth = 2.0;
	
	[pth moveToPoint:CGPointMake(xoff, halfH)];
	[pth addLineToPoint:CGPointMake(halfW, yoff)];
	[pth addLineToPoint:CGPointMake(rect.size.width - xoff, halfH)];
	[pth addLineToPoint:CGPointMake(halfW, rect.size.height - yoff)];
	[pth closePath];
	
	[self.titleLabel.textColor setStroke];
	
	[pth stroke];
	
}

- (void)setHighlighted:(BOOL)highlighted {
	[self setNeedsDisplay];
	[super setHighlighted:highlighted];
}

@end
