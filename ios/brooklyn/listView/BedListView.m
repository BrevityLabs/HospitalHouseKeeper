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
    
    Bed *beds =[[Bed alloc]init];
    Array =[beds getCleaningStaffName];
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
    
    list = [Array objectAtIndex:indexPath.row];
    
    Employee *employ = [[Employee alloc]initWithEmployeeID:list.empId];

    UILabel *bedIdLabel=(UILabel *)[cell viewWithTag:BEDID_TAG];
    bedIdLabel.text = list.bedId;
    NSLog(@"bedid %@",bedIdLabel.text);
    bedIdLabel.textAlignment = UITextAlignmentCenter;
    
    UILabel *bedNoLabel=(UILabel *)[cell viewWithTag:BEDNO_TAG];
    bedNoLabel.text = list.bedNo;
    bedNoLabel.textAlignment = UITextAlignmentCenter;
    
    UILabel *patientLabel=(UILabel *)[cell viewWithTag:PATIENT_TAG];
    patientLabel.text = employ.name;
    patientLabel.textAlignment = UITextAlignmentCenter;
    
    UIButton *actionBtn =(UIButton *)[cell viewWithTag:ACTION_TAG];
    actionBtn.backgroundColor =[UIColor whiteColor];
   
    
    UILabel *bedTypeLabel=(UILabel *)[cell viewWithTag:BEDTYPE_TAG];
    bedTypeLabel.text = @"Standard";
    
    
    UIImageView *colorImage = (UIImageView* )[cell viewWithTag:COLOR_TAG];
    colorImage.image =[UIImage imageNamed:@"icon_red.png"];
   
    UILabel *statusLabel=(UILabel *)[cell viewWithTag:STATUS_TAG];
    statusLabel.text = @"Under maintenance";                    
    
    return cell;
    
}

-(UITableViewCell *)reuseTableViewCellWithIdentifier:(NSString *)identifier
{
    
    CGRect cellRectangle;
    
    cellRectangle = CGRectMake(0,0,CELL_WIDTH,ROW_HEIGHT);    
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
    actionBtn.frame = CGRectMake(315, 10, 150, 30);
     [actionBtn setTitle:@"cleaning done" forState:UIControlStateNormal];
     [actionBtn addTarget:self action:@selector(cleaningDone:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:actionBtn];
    
    CGRect rect4 = CGRectMake(490, 0, 99, 44);
    UILabel *bedTypeLabel= [[UILabel alloc]initWithFrame:rect4];
    bedTypeLabel.tag =BEDTYPE_TAG; 
    [cell.contentView addSubview:bedTypeLabel];
    
    CGRect rect5 = CGRectMake(595, 0,30, 30);
    UIImageView *colorImage = [[UIImageView alloc]initWithFrame:rect5];
    colorImage.tag =COLOR_TAG;
    [cell.contentView addSubview:colorImage];
    
    
    CGRect rect6 = CGRectMake(645,0, 170, 44);
    UILabel *statusLabel= [[UILabel alloc]initWithFrame:rect6];
    statusLabel.tag =STATUS_TAG; 
    [cell.contentView addSubview:statusLabel];
    return cell;
    
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section    
{
    return [Array count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
   NSMutableArray *ary = [Bed getCleanBedNoList];
    Bed *bed =[[Bed alloc]initWithBedId:[ary objectAtIndex:indexPath.row]];
    if (indexPath.row ==indexPath.row) 
    {
    MaintStaffDetailView *detailViewController = [[MaintStaffDetailView alloc] initWithNibName:@"MaintStaffDetailView" bundle:nil];
        detailViewController.modalTransitionStyle =UIModalTransitionStyleCrossDissolve;
        [detailViewController getbedtitle:bed.number];
        [self presentModalViewController:detailViewController animated:YES];
    }
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
-(IBAction)cleaningDone:(id)sender
{ 
    //     NSMutableArray *str =[Bed getCleanBedNoList];
    //    for (int i=0; i<[bedNoArray count]; i++) {
    //         NSLog(@"bedid %@",[str objectAtIndex:i]);
    //        
    //          NSLog(@"bedid %@",bednumber);
    //        if ([label.text isEqualToString:[str objectAtIndex:i]]){
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                      message:@"Are you sure that the bed is clean and it can be set as Available?"
                                                     delegate:self
                                            cancelButtonTitle:@"Ok"
                                            otherButtonTitles:@"Cancel", nil];
    [message show];
    
    
    //        }
    //    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex // updating the status = 3(ready to occupy)
{
    
    
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    Bed *bed =[[Bed alloc]init];
    
    NSLog(@"number is %@",bed.bedNo);
    if([title isEqualToString:@"Ok"])
    {
        [bed updateBedStatus:bed.bedNo];
        NSLog(@"number is %@",bed.bedNo);
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Thanks"
                                                          message:@" The bed status has been changed to Available"
                                                         delegate:nil
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles:@"Cancel", nil];
        [message show];
        
    }
    
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
