//
//  OCBPlus.m
//  ButtonSubclass
//
//  Created by Don Mini on 3/18/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "OCBPlus.h"

@interface OCBPlusInnerView : UIView

@property (strong, nonatomic) UIColor *strokeColor;

@end

@implementation OCBPlusInnerView

- (void)drawRect:(CGRect)rect {
	
	[super drawRect:rect];
	
	CGFloat halfW = rect.size.width / 2;
	CGFloat halfH = rect.size.height / 2;
	
	// draw a diamond shape inside the rounded rect, just to demonstrate a little additional drawing
	
	CGFloat xoff = halfW * 0.1;
	CGFloat yoff = halfH * 0.1;
	
	UIBezierPath *pth = [[UIBezierPath alloc] init];
	
	pth.lineWidth = 2.0;
	
	CGPoint pt = CGPointZero;
	
	pt.x = xoff;
	pt.y = halfH;
	
	[pth moveToPoint:pt];
	
	pt.x = halfW;
	pt.y = yoff;
	
	[pth addLineToPoint:pt];
	
	pt.x = rect.size.width - xoff;
	pt.y = halfH;
	
	[pth addLineToPoint:pt];
	
	pt.x = halfW;
	pt.y = rect.size.height - yoff;
	
	[pth addLineToPoint:pt];
	
	[pth closePath];
	
	[_strokeColor set];
	
	[pth stroke];
	
}


@end

IB_DESIGNABLE

@interface OCBPlus ()

@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
@property (assign, nonatomic) IBInspectable UIColor *borderColor;
@property (assign, nonatomic) IBInspectable CGFloat shadowRadius;
@property (assign, nonatomic) IBInspectable CGFloat shadowOpacity;
@property (assign, nonatomic) IBInspectable CGSize shadowOffset;
@property (assign, nonatomic) IBInspectable UIColor *shadowColor;

@property (strong, nonatomic) OCBPlusInnerView *subImageView;

@end

@implementation OCBPlus

- (void) setBorderWidth:(CGFloat)borderWidth {
	if (borderWidth != _borderWidth) {
		_borderWidth = borderWidth;
		self.layer.borderWidth = borderWidth;
	}
}

- (void)setBorderColor:(UIColor *)borderColor {
	if (borderColor != _borderColor) {
		_borderColor = borderColor;
		self.layer.borderColor = borderColor.CGColor;
	}
}

- (void)setShadowColor:(UIColor *)shadowColor {
	if (shadowColor != _shadowColor) {
		_shadowColor = shadowColor;
		self.layer.shadowColor = shadowColor.CGColor;
	}
}

- (void)setShadowRadius:(CGFloat)shadowRadius {
	if (shadowRadius != _shadowRadius) {
		_shadowRadius = shadowRadius;
		self.layer.shadowRadius = shadowRadius;
	}
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity {
	if (shadowOpacity != _shadowOpacity) {
		_shadowOpacity = shadowOpacity;
		self.layer.shadowOpacity = shadowOpacity;
	}
}

- (void)setShadowOffset:(CGSize)shadowOffset {
	if (shadowOffset.width != _shadowOffset.width || shadowOffset.height != _shadowOffset.height) {
		_shadowOffset = shadowOffset;
		self.layer.shadowOffset = _shadowOffset;
	}
}

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
	
	if (!_borderColor) {
		_borderColor = [UIColor blackColor];
	}
	if (!_shadowColor) {
		_shadowColor = [UIColor blackColor];
	}

	if (!_subImageView) {
		_subImageView = [[OCBPlusInnerView alloc] init];
		_subImageView.userInteractionEnabled = NO;
		[self addSubview:_subImageView];
	}
	
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	CGFloat cRadius = MIN(self.bounds.size.height, self.bounds.size.width) / 2.0;
	self.layer.cornerRadius = cRadius;
	_subImageView.layer.cornerRadius = cRadius;
	_subImageView.layer.masksToBounds = YES;
	
	_subImageView.backgroundColor = self.backgroundColor == nil ? [UIColor clearColor] : self.backgroundColor;
	_subImageView.strokeColor = [self titleColorForState:UIControlStateNormal] == nil ? [UIColor blackColor] : [self titleColorForState:UIControlStateNormal];
	
	_subImageView.frame = self.bounds;
}

@end

