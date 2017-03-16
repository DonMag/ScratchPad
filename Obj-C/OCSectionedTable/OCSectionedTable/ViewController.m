//
//  ViewController.m
//  OCSectionedTable
//
//  Created by Don Mag on 3/13/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *theTextField;

@end

@implementation ViewController

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	
	//textField.attributedText = NSAttributedString(string: "", attributes: [NSForegroundColorAttributeName : UIColor.white, NSParagraphStyleAttributeName : paraStyle, NSFontAttributeName : UIFont.init(name: "HelveticaNeue-Bold", size: 16)]);
	
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
