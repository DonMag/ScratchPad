//
//  CountriesTableViewController.h
//  OCSectionedTable
//
//  Created by Don Mag on 3/13/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "OriginalCountries.h"

@interface CountriesTableViewController : UITableViewController

@property (strong, nonatomic) UIView *watchView;
@property (nonatomic) NSUInteger tapCount;

@property (strong, nonatomic) UIImage *tmpImage;
@property (strong, nonatomic) UIImageView *tmpIV;

@end
