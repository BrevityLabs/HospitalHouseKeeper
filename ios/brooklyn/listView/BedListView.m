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
@synthesize number;
@synthesize bednumber;
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
    Array =[Bed getCleanBedNoList];  
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Configure the cell...
    //MaintDB *emp = [Array objectAtIndex:indexPath.row];
	//cell.textLabel.text= [NSString stringWithFormat:@"%@           %@    %@", emp.Eid,emp.Bedno,emp.Ename];
    
    static NSString *identifier =@"My Cell";
    
    UITableViewCell *cell =[self.listView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
        
         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier: identifier];
    
    NSString *str =[Array objectAtIndex:indexPath.row];
    Bed *list =[[Bed alloc]initWithBedId:str]; 
    [list getCleaningStaffName:list.bedId];
   Employee *employ = [[Employee alloc]initWithEmployeeID:list.empId];

    CGRect rect1 = CGRectMake(0,0, 58, 44);
       UILabel *bedIdLabel= [[UILabel alloc]initWithFrame:rect1];
    bedIdLabel.tag =BEDID_TAG; 
    bedIdLabel.text = list.bedId;
    bedIdLabel.textAlignment = UITextAlignmentCenter;
      [cell.contentView addSubview:bedIdLabel];
   
    
    CGRect rect2 = CGRectMake(60,0, 74, 44);
    UILabel *bedNoLabel= [[UILabel alloc]initWithFrame:rect2];
    bedNoLabel.tag =BEDNO_TAG;
    bedNoLabel.text = list.bedNo;
    bedNoLabel.textAlignment = UITextAlignmentCenter;
    [cell.contentView addSubview:bedNoLabel];
        
    CGRect rect3 = CGRectMake(140,0, 170, 44);
    UILabel *patientLabel= [[UILabel alloc]initWithFrame:rect3];
    patientLabel.tag =PATIENT_TAG; 
    patientLabel.text = employ.name;
    NSLog(@"employee name %@",employ.name);
    patientLabel.textAlignment = UITextAlignmentCenter;
    [cell.contentView addSubview:patientLabel];
    
    UIButton *actionBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    actionBtn.frame = CGRectMake(315, 10, 150, 30);
    number =list.bedNo;
    [actionBtn addTarget:self action:@selector(cleaningDone:) forControlEvents:UIControlEventTouchUpInside];
    [actionBtn setBackgroundImage:[UIImage imageNamed:@"Status.jpg"] forState:UIControlStateNormal];
    [actionBtn setTitle:number forState:UIControlStateNormal];
    [actionBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];    
    actionBtn.titleLabel.hidden =YES;
    [cell.contentView addSubview:actionBtn];
        
    CGRect rect4 = CGRectMake(490, 0, 99, 44);
    UILabel *bedTypeLabel= [[UILabel alloc]initWithFrame:rect4];
    bedTypeLabel.tag =BEDTYPE_TAG;
    bedTypeLabel.text = @"Standard";
    [cell.contentView addSubview:bedTypeLabel];    
    
    
    CGRect rect5 = CGRectMake(595, 0,30, 30);
    UIImageView *colorImage = [[UIImageView alloc]initWithFrame:rect5];
    colorImage.tag =COLOR_TAG;
    colorImage.image =[UIImage imageNamed:@"icon_red.png"];
    [cell.contentView addSubview:colorImage];
      
    CGRect rect6 = CGRectMake(645,0, 170, 44);
    UILabel *statusLabel= [[UILabel alloc]initWithFrame:rect6];
    statusLabel.tag =STATUS_TAG; 
     statusLabel.text = @"Under maintenance";  
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
-(IBAction)cleaningDone:(UIButton* )sender
{ 
  
    bednumber  =sender.titleLabel.text;
    NSLog(@"number is %@",bednumber);
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                      message:@"Are you sure that the bed is clean and it can be set as Available?"
                                                     delegate:self
                                            cancelButtonTitle:@"Ok"
                                            otherButtonTitles:@"Cancel", nil];
    [message show];
    
     
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex // updating the status = 3(ready to occupy)
{
    
    
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    Bed *bed =[[Bed alloc]init];
    
    NSLog(@"number is %@",bednumber);
    if([title isEqualToString:@"Ok"])
    {
        [bed updateBedStatus:bednumber];
        NSLog(@"number is %@",number);
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Thanks"
                                                          message:@" The bed status has been changed to Available"
                                                         delegate:nil
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles:@"Cancel", nil];
        [message show];
        
        [self.listView reloadData];
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
