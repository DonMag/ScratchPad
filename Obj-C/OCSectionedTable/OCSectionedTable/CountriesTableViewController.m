//
//  CountriesTableViewController.m
//  OCSectionedTable
//
//  Created by Don Mag on 3/13/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

#import "CountriesTableViewController.h"

#import "CountryManager.h"
#import "OriginalCountries.h"

@interface CountriesTableViewController ()

@property (strong, nonatomic) NSArray *sortedCountriesList;

@property (strong, nonatomic) NSMutableDictionary *sectionsDictionary;
@property (strong, nonatomic) NSMutableArray *sortedCountryLetters;

@property (strong, nonatomic) NSDictionary *countriesInfo;

@end

@implementation CountriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	CountryManager *cMgr = [[CountryManager alloc] init];
	_sortedCountriesList = [cMgr getCountries];
	_sectionsDictionary = [self fillingDictionary:_sortedCountriesList];
	
}

-(NSMutableDictionary *)fillingDictionary:(NSArray *)ary
{
	
	// This method has the real magic of this sample
	
	_sortedCountryLetters = [[NSMutableArray alloc] init];
	[_sortedCountryLetters removeAllObjects];
	
	NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
	
	// Get the first character of your string which will be your key
	
	for(NSString *str in ary)
	{
		NSString *firstLetter = [[str substringToIndex:1] uppercaseString];
								 
		if(![_sortedCountryLetters containsObject:firstLetter])
		{
			NSMutableArray *charArray = [[NSMutableArray alloc] init];
			[charArray addObject:str];
			[_sortedCountryLetters addObject:firstLetter];
			[dic setValue:charArray forKey:firstLetter];
		}
		else
		{
			NSMutableArray *prevArray = (NSMutableArray *)[dic valueForKey:firstLetter];
			[prevArray addObject:str];
			[dic setValue:prevArray forKey:firstLetter];
		}
		
	}
	return dic;
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sortedCountryLetters.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	NSArray *ary = [_sectionsDictionary valueForKey:[_sortedCountryLetters objectAtIndex:section]];
	return [ary count];
	
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stdCell" forIndexPath:indexPath];
    
    // Configure the cell...

	NSString *key = [_sortedCountryLetters objectAtIndex:[indexPath section]];
	NSArray *array = (NSArray *)[_sectionsDictionary valueForKey:key];
	NSString *cellTitle = [array objectAtIndex:[indexPath row]];
	[cell.textLabel setText:cellTitle];

    return cell;
}

#if 1

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [_sortedCountryLetters objectAtIndex:section];
}

#else

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
	[header setBackgroundColor:[UIColor blueColor]];
	UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 320, 30)];
	[header addSubview:lbl];
	[lbl setTextColor:[UIColor whiteColor]];
	[lbl setBackgroundColor:[UIColor clearColor]];
	[lbl setText:[_sortedCountryLetters objectAtIndex:section]];
	return header;
	
}

#endif

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
	return _sortedCountryLetters;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
	[tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:YES];
	return -1; // [_sortedCountryLetters indexOfObject:title];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
