//
//  ViewController.m
//  tmpOC
//
//  Created by Don Mag on 4/5/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "ViewController.h"

#import "SampleTableViewCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	_tableView.contentInset = UIEdgeInsetsMake(76, 0, 0, 0);
	_tableView.rowHeight = 82;
	
//	_tableView.backgroundColor = [UIColor cyanColor];

	// force auto-layout calcs to happen before view appears
	// so we can add the correct size layer mask
	[self.view setNeedsLayout];
	[self.view layoutIfNeeded];

}

- (void)viewDidLayoutSubviews {
	[self addTopOpacityMask];
}


- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
	
	// best call super just in case
	[super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
	
	// will execute before rotation
	
	[coordinator animateAlongsideTransition:^(id  _Nonnull context) {
		
		// will execute during rotation
		
	} completion:^(id  _Nonnull context) {
		
		// will execute after rotation

		[self addTopOpacityMask];

	}];
}

- (void)addTopMaskToTableViewToHideTopPortion
{
	CAShapeLayer *shapeLayer = [CAShapeLayer layer];
	shapeLayer.fillRule = kCAFillRuleEvenOdd;
	CGRect maskRect = CGRectMake(0, 76, CGRectGetWidth(self.tableView.frame), self.tableView.bounds.size.height - 76);
	
	CGPathRef path = CGPathCreateWithRect(maskRect, NULL);
	shapeLayer.path = path;
	CGPathRelease(path);
	
	self.tableView.layer.mask = shapeLayer;
}

- (void)addTopSemiTransparentLayer
{
	CAShapeLayer *shapeLayer = [CAShapeLayer layer];
	shapeLayer.fillRule = kCAFillRuleEvenOdd;
	shapeLayer.fillColor = [UIColor blackColor].CGColor;
	shapeLayer.opacity = 0.5;
	CGRect maskRect = CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame),76);
	
	CGPathRef path = CGPathCreateWithRect(maskRect, NULL);
	shapeLayer.path = path;
	CGPathRelease(path);
	
	[self.tableView.superview.layer addSublayer :shapeLayer];
}

- (void)addTopOpacityMask {
	
//	[self addTopMaskToTableViewToHideTopPortion];
//	return;
	
	CGRect rect = _tableView.frame;
	CGRect r = rect;

	UIGraphicsBeginImageContext(rect.size);
	CGContextRef context = UIGraphicsGetCurrentContext();

	// fill a "top rect" with black at 5% opacity
	r.size.height = 76;
	
	CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.0 alpha:0.05].CGColor);
	CGContextFillRect(context, r);
	
	// fill the rest of the layer with black at 100% opacity
	r.origin.y = 76;
	r.size.height = rect.size.height;
	
	CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
	CGContextFillRect(context, r);
	
	// grab a UIImage from the context
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	// create a Layer
	CALayer *theLayer = [CALayer layer];
	
	// set the Layer content to the just-created image
	theLayer.contents = (__bridge id _Nullable)(image.CGImage);
	
	theLayer.frame = rect;
	
	// mask the view holding the tableview
	_tableView.superview.layer.mask = theLayer;
	
	
//	CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//	gradientLayer.frame = self.tableView.frame;
//	
//	id transparent = (id)[UIColor clearColor].CGColor;
//	id opaque = (id)[UIColor blackColor].CGColor;
//	gradientLayer.colors = @[transparent, opaque, opaque];
//	gradientLayer.locations = @[@0.01, @0.11, @1];
//	self.tableView.superview.layer.mask = gradientLayer;
	
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	SampleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
 
	if (indexPath.row == 0) {
		
		cell.theImageView.backgroundColor = [UIColor clearColor];
		cell.theImageView.image = [UIImage imageNamed:@"face"];
		cell.lblA.text = @"Blondie Bumstead";
		cell.lblB.text = @"Asked you a question";
		cell.lblC.text = @"How tall is the ocean?";
		
	} else {
 
		cell.theImageView.backgroundColor = [UIColor grayColor];
		cell.theImageView.image = nil;
		cell.lblA.text = @"Somebody's Name";
		cell.lblB.text = @"Did Something";
		cell.lblC.text = [NSString stringWithFormat:@"And this is row %ld", (long)indexPath.row + 1];
		
	}
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"%@", indexPath);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
