//
//  SampleTableViewCell.h
//  tmpOC
//
//  Created by Don Mag on 4/6/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SampleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *theImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblA;
@property (weak, nonatomic) IBOutlet UILabel *lblB;
@property (weak, nonatomic) IBOutlet UILabel *lblC;

@end
