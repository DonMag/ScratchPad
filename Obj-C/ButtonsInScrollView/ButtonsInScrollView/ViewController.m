//
//  ViewController.m
//  ButtonsInScrollView
//
//  Created by Don Mag on 3/1/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *theScrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)backBtnTapped:(id)sender {
	CGRect r = CGRectMake(0.0, 0.0, 1.0, 1.0);
	[_theScrollView scrollRectToVisible:r animated:YES];
}
- (IBAction)forwardBtnTapped:(id)sender {
	CGRect r = CGRectMake(_theScrollView.contentSize.width - 1, 0.0, 1.0, 1.0);
	[_theScrollView scrollRectToVisible:r animated:YES];
}

@end
