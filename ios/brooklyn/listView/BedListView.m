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
    
    // Configure the cell...
    //MaintDB *emp = [Array objectAtIndex:indexPath.row];
	//cell.textLabel.text= [NSString stringWithFormat:@"%@           %@    %@", emp.Eid,emp.Bedno,emp.Ename];
    
    static NSString *identifier =@"My Cell";
    
    UITableViewCell *cell =[self.listView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
        
        cell=[self reuseTableViewCellWithIdentifier:identifier];
    
    MaintDB *emp = [Array objectAtIndex:indexPath.row];
    
    UILabel *bedIdLabel=(UILabel *)[cell viewWithTag:BEDID_TAG];
    bedIdLabel.text = emp.Eid;
    bedIdLabel.textAlignment = UITextAlignmentCenter;
    
    UILabel *bedNoLabel=(UILabel *)[cell viewWithTag:BEDNO_TAG];
    bedNoLabel.text = emp.Bedno;
    bedNoLabel.textAlignment = UITextAlignmentCenter;
    
    UILabel *patientLabel=(UILabel *)[cell viewWithTag:PATIENT_TAG];
    patientLabel.text = emp.Ename;
    patientLabel.textAlignment = UITextAlignmentCenter;
    
    UIButton *actionBtn =(UIButton *)[cell viewWithTag:ACTION_TAG];
    NSString *actionStr = @" cleaning done" ;
    [actionBtn setTitle:actionStr forState:UIControlStateHighlighted];
    
    
    UILabel *bedTypeLabel=(UILabel *)[cell viewWithTag:BEDTYPE_TAG];
    bedTypeLabel.text = @"Standard";
    
    
    UILabel *colorLabel = (UILabel *)[cell viewWithTag:COLOR_TAG];
    colorLabel.backgroundColor = [UIColor redColor];
    
    UILabel *statusLabel=(UILabel *)[cell viewWithTag:STATUS_TAG];
    statusLabel.text = @"Under maintenance";                    
    
    return cell;
    
}

-(UITableViewCell *)reuseTableViewCellWithIdentifier:(NSString *)identifier
{
    
    CGRect cellRectangle;
    
    cellRectangle = CGRectMake(0,0,850,44);    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier: identifier];
    cell.frame =cellRectangle;
    
    UILabel *bedIdLabel;
    
    CGRect rect1 = CGRectMake(0,0, 58, 44);
    bedIdLabel= [[UILabel alloc]initWithFrame:rect1];
    bedIdLabel.tag =BEDID_TAG; 
    [cell.contentView addSubview:bedIdLabel];
    
    
    CGRect rect2 = CGRectMake(60,0, 74, 44);
    UILabel *bedNoLabel= [[UILabel alloc]initWithFrame:rect2];
    bedNoLabel.tag =BEDNO_TAG; 
    [cell.contentView addSubview:bedNoLabel];
    
    CGRect rect3 = CGRectMake(140,0, 170, 44);
    UILabel *patientLabel= [[UILabel alloc]initWithFrame:rect3];
    patientLabel.tag =PATIENT_TAG; 
    [cell.contentView addSubview:patientLabel];
    
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    actionBtn.frame = CGRectMake(315, 0, 160, 40);
    [cell.contentView addSubview:actionBtn];
    
    CGRect rect4 = CGRectMake(490, 0, 99, 44);
    UILabel *bedTypeLabel= [[UILabel alloc]initWithFrame:rect4];
    bedTypeLabel.tag =BEDTYPE_TAG; 
    [cell.contentView addSubview:bedTypeLabel];
    
    CGRect rect5 = CGRectMake(600, 0,40, 30);
    UILabel *colorLabel = [[UILabel alloc]initWithFrame:rect5];
    colorLabel.tag =COLOR_TAG;
    [cell.contentView   addSubview:colorLabel];
    
    
    CGRect rect6 = CGRectMake(645,0, 170, 27);
    UILabel *statusLabel= [[UILabel alloc]initWithFrame:rect6];
    statusLabel.tag =STATUS_TAG; 
    [cell.contentView addSubview:statusLabel];
    return cell;
    
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section    
{
    return [Array count];
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    
//    if (indexPath.row !=0) 
//    {
//   // [listView deselectRowAtIndexPath:indexPath animated:NO];
//    
//    MaintStaffDetailView *detailViewController = [[MaintStaffDetailView alloc] initWithNibName:@"MaintStaffDetailView" bundle:nil];
//    
//    [[self navigationController ] pushViewController:detailViewController animated:YES];
//    }
//    
//}
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
