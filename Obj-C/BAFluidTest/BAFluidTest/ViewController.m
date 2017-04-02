//
//  ViewController.m
//  BAFluidTest
//
//  Created by Don Mini on 4/1/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "ViewController.h"

#import "BAFluidView.h"
#import "UIColor+ColorWithHex.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *theView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	

	// load mask and outline
	UIImage *maskingImage = [UIImage imageNamed:@"blueDrop"];
	UIImage *outlineImage = [UIImage imageNamed:@"whiteOutlineThin"];

	// define rect equal to size of mask image
	CGRect rfv = CGRectMake(0, 0, maskingImage.size.width, maskingImage.size.height);
	
	// instantiate BAFluidView
	BAFluidView *fluidView = [[BAFluidView alloc] initWithFrame:rfv startElevation:@0.3];
	fluidView.fillColor = [UIColor colorWithHex:0x092eee];
	[fluidView fillTo:@0.90];
	[fluidView startAnimation];
	
	// if you want the "droplet" filled with a color
	//	fluidView.backgroundColor = [UIColor yellowColor];

	// instantiate a couple CALayer objects
	CALayer *maskingLayer = [CALayer layer];
	CALayer *outlineLayer = [CALayer layer];
	
	// set size to match mask
	maskingLayer.frame = rfv;
	outlineLayer.frame = rfv;
	
	// set mask layer content to mask image
	[maskingLayer setContents:(id)[maskingImage CGImage]];

	// give the mask layer to BAFluidView
	[fluidView.layer setMask:maskingLayer];
	
	// set outline layer content to outline image
	[outlineLayer setContents:(id)[outlineImage CGImage]];
	
	// create a "container" view
	UIView *containerView = [[UIView alloc] initWithFrame:rfv];
	
	// add the outline layer
	[containerView.layer addSublayer:outlineLayer];
	
	// add the BAFluidView
	[containerView addSubview:fluidView];

	// add the container view to the screen / main view
	[self.view addSubview:containerView];

	// position the view with constraints...
	containerView.translatesAutoresizingMaskIntoConstraints = NO;
	
	[containerView.widthAnchor constraintEqualToConstant:rfv.size.width].active = YES;
	[containerView.heightAnchor constraintEqualToConstant:rfv.size.height].active = YES;
	[containerView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
	[containerView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
