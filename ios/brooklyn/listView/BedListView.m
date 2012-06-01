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
//    UILabel *Label1 = [[UILabel alloc]initWithFrame:CGRectMake(112,260, 58, 44)];
//    Label1.text = emp.Eid;
//    Label1.textAlignment = UITextAlignmentCenter;
//    [cell.contentView addSubview:Label1];
//
//    UILabel *Label2 = [[UILabel alloc]initWithFrame:CGRectMake(172,260, 74, 44)];
//    Label2.text = emp.Bedno;
//    Label2.textAlignment = UITextAlignmentCenter;
//    [cell.contentView addSubview:Label2];
//
//    UILabel *Label3= [[UILabel alloc]initWithFrame:CGRectMake(249,260, 170, 44)];
//    Label3.text = @"Under maintenance";
//    Label3.textAlignment = UITextAlignmentCenter;
//    [cell.contentView addSubview:Label3];
//
//    
//UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    actionBtn.frame = CGRectMake(422, 260, 170, 30);
//   [actionBtn setTitle:@"cleaning done" forState:UIControlStateNormal];
//   [cell.contentView addSubview:actionBtn];
////    
//    
//    UILabel *typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(594, 260, 99, 44)];
//    typeLabel.text = @"Standard";
//    typeLabel.textAlignment = UITextAlignmentCenter;
//    [cell.contentView addSubview:typeLabel];
//    
//    UIButton *colorBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    colorBtn.frame = CGRectMake(696, 260, 52, 44);
//    [colorBtn setBackgroundColor:[UIColor redColor]];
//    [cell.contentView addSubview:colorBtn];
////   
//    
//    UILabel *statusLabel = [[UILabel alloc]initWithFrame:CGRectMake(751,260, 165, 27)];
//    statusLabel.text = @"Under maintenance";
//    statusLabel.textAlignment = UITextAlignmentCenter;
//    [cell.contentView addSubview:statusLabel];

    static NSString *identifier =@"My Cell";
    
    UITableViewCell *cell =[self.listView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
        
        cell=[self reuseTableViewCellWithIdentifier:identifier];
    
    MaintDB *emp = [Array objectAtIndex:indexPath.row];
    
    UILabel *bedIdLabel=(UILabel *)[cell viewWithTag:BEDID_TAG];
    bedIdLabel.text = emp.Eid;
    
    UILabel *bedNoLabel=(UILabel *)[cell viewWithTag:BEDNO_TAG];
    bedNoLabel.text = emp.Bedno;

    UILabel *patientLabel=(UILabel *)[cell viewWithTag:PATIENT_TAG];
    patientLabel.text = emp.Ename;
    
    UIButton *actionBtn =(UIButton *)[cell viewWithTag:ACTION_TAG];
   [actionBtn setTitle:@"cleaning done" forState:UIControlStateNormal];
 
        return cell;

    
}

-(UITableViewCell *)reuseTableViewCellWithIdentifier:(NSString *)identifier
{
    CGRect cellRectangle;
    
    cellRectangle = CGRectMake(112.0,260.0,800.0,197.0);
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier: identifier];
    cell.frame =cellRectangle;
    
 
    UILabel *bedIdLabel;
    
   CGRect rect1 = CGRectMake(112.0,260, 58, 44);
    bedIdLabel= [[UILabel alloc]initWithFrame:rect1];
    bedIdLabel.tag =BEDID_TAG; 
    [cell.contentView addSubview:bedIdLabel];
    
    
    CGRect rect2 = CGRectMake(172,260, 74, 44);
    UILabel *bedNoLabel= [[UILabel alloc]initWithFrame:rect2];
    bedNoLabel.tag =BEDID_TAG; 
    [cell.contentView addSubview:bedNoLabel];
    
    CGRect rect3 = CGRectMake(249,260, 170, 44);
    UILabel *patientLabel= [[UILabel alloc]initWithFrame:rect3];
    patientLabel.tag =BEDID_TAG; 
    [cell.contentView addSubview:patientLabel];
    
    CGRect rect4 = CGRectMake(594, 260, 99, 44);
    UILabel *bedTypeLabel= [[UILabel alloc]initWithFrame:rect4];
    bedTypeLabel.tag =BEDID_TAG; 
    [cell.contentView addSubview:bedTypeLabel];

    CGRect rect5 = CGRectMake(751,260, 165, 27);
    UILabel *statusLabel= [[UILabel alloc]initWithFrame:rect5];
    statusLabel.tag =BEDID_TAG; 
    [cell.contentView addSubview:statusLabel];
    return cell;
    
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    actionBtn.frame = CGRectMake(422, 260, 170, 30);
    [cell.contentView addSubview:actionBtn];
    
    UIButton *colorBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    colorBtn.frame = CGRectMake(696, 260, 52, 44);
    [colorBtn setBackgroundColor:[UIColor redColor]];
    [cell.contentView addSubview:colorBtn];


}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section    
{
    return [Array count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     MaintStaffDetailView *detailViewController = [[MaintStaffDetailView alloc] initWithNibName:@"MaintStaffDetailView" bundle:nil];
  
     [self.navigationController pushViewController:detailViewController animated:YES];
     
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
