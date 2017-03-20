//
//  ViewController.m
//  OCSectionedTable
//
//  Created by Don Mag on 3/13/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "ViewController.h"

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonHMAC.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *theTextField;

@end

@implementation ViewController

NSData *hmacForKeyAndData(NSString *key, NSString *data)
{
	const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
	const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
	unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
	CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
	return [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	
	//textField.attributedText = NSAttributedString(string: "", attributes: [NSForegroundColorAttributeName : UIColor.white, NSParagraphStyleAttributeName : paraStyle, NSFontAttributeName : UIFont.init(name: "HelveticaNeue-Bold", size: 16)]);
	
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	NSData *tmp = hmacForKeyAndData(@"thisisakey", @"This is a string");
	NSLog(@"result: %@", tmp);

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
