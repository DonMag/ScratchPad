//
//  ChecksTableViewController.m
//  TableViewCheckmarks
//
//  Created by Don Mag on 3/6/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "ChecksTableViewController.h"

@interface ChecksTableViewController ()

@end

@implementation ChecksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

	// want to change the foreground / text color of the Checkmarks?
//	self.tableView.tintColor = [UIColor redColor];
	
	self.tableView.rowHeight = 80.0;
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (cell.accessoryView) {

		CGRect r = cell.frame;
		CGRect cvr = cell.contentView.frame;
		CGRect avr = cell.accessoryView.bounds;

		avr.size.width = r.size.width - cvr.size.width;
		cell.accessoryView.frame = avr;
		
	}
	
	
	int x = 1;
	
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aCell" forIndexPath:indexPath];
	
	BOOL bShowCheckmark = indexPath.row % 2;
	
    // Configure the cell...
	
	cell.textLabel.text = [NSString stringWithFormat:@"Section / Row: %ld / %ld", (long)indexPath.section, (long)indexPath.row];
	
	UIView* myBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
	
	myBackgroundView.backgroundColor = [UIColor cyanColor];

//	cell.backgroundView = myBackgroundView;
	
	cell.textLabel.backgroundColor = [UIColor yellowColor];

	cell.accessoryType = UITableViewCellAccessoryCheckmark;
	
	if (!bShowCheckmark) {
		UIView* myAcc = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.accessoryView.frame.size.width, 4)];
		myAcc.backgroundColor = [UIColor whiteColor];
		cell.accessoryView = myAcc;
	}
	
//	cell.accessoryType = indexPath.row % 2 ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
