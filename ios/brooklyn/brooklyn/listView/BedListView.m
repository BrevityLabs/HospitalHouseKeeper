//
//  BedListView.m
//  HospitalBedManagementSystem
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "BedListView.h"


@implementation BedListView

@synthesize listView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    Array =[MaintList getAllData];
    
  }

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    MaintDB *emp = [Array objectAtIndex:indexPath.row];
	cell.textLabel.text= [NSString stringWithFormat:@"%@           %@", emp.Eid,emp.Bedno];
    
    // cell.textLabel.text =emp.Ename;
    return cell;

    
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section    
{
    return [Array count];
}

-(IBAction)getGridView:(id)sender
{
    BedStatusView *grid = [[BedStatusView alloc]initWithNibName:@"BedStatusView" bundle:nil];
    
    grid.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:grid animated:YES];
    
}


-(IBAction)signOut:(id)sender
{
    MaintStaffLogin *login = [[MaintStaffLogin alloc]initWithNibName:@"MaintStaffLogin" bundle:nil];
    
    login.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:login animated:YES];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
