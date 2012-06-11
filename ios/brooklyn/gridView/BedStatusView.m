//
//  BedStatusView.m
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "BedStatusView.h"




//static sqlite3_stmt *selectStmt = nil;

@implementation BedStatusView

@synthesize maintBedView,listViewButton,gridViewButton,signOutButton;

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

//#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
     // Do any additional setup after loading the view from its nib.
    int j=0;
    bedNoArray = [Bed getCleanBedNoList];
    int i=1;
    while (i>j) {
        for (; j<[bedNoArray count]; j++) {
              NSString *str=[bedNoArray objectAtIndex:j];            
             [self drawBedAvailable:(300 * j) y: (i*150.0) width:250.0 height:200.0 bedId:str] ;
                   }
        i++;
    }

    
   
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(IBAction)gridView:(id)sender
{
   if (self.view ==nil)
   {
       int j=0;
       bedNoArray = [Bed getCleanBedNoList];
       int i=1;
       while (i>j) {
           for (; j<[bedNoArray count]; j++) {
               NSString *str=[bedNoArray objectAtIndex:j];            
               [self drawBedAvailable:(300 * j) y: (i*150.0) width:250.0 height:200.0 bedId:str] ;
           }
           i++;
       }
   }

}


-(IBAction)signOut:(id)sender
{
    [self clickSignOut];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
                   bedId : (NSString *) _bedId
{
    
    CGRect myRect = CGRectMake(x_pos, y_pos, _width, _height);
    maintBedView = [[UIView alloc]initWithFrame:myRect];
    maintBedView.layer.borderColor = [UIColor blueColor].CGColor;
    maintBedView.layer.borderWidth = 3.0f;

    
    UIButton *imgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    imgButton.frame = CGRectMake(IMGBTNXOFFSET, IMGBTNYOFFSET, IMGBTNWIDTH, IMGBTNHEIGHT);
    [imgButton setBackgroundImage:[UIImage imageNamed:@"bed_status2.png"] forState:UIControlStateNormal];
    
    [maintBedView addSubview:imgButton];
    
    UIButton *numberbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [numberbutton addTarget:self action:@selector(maintStaffDetilView:) forControlEvents:UIControlEventTouchUpInside];
    
    numberbutton.frame=CGRectMake(NUMBUTTON_X,NUMBUTTON_Y, NUMBUTTON_WIDTH, NUMBUTTON_HEIGHT);
    [numberbutton setTitle:_bedId forState:UIControlStateNormal]; 
    
    [numberbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];    
    
    [numberbutton setBackgroundColor:[UIColor whiteColor]]; 
    
    [maintBedView addSubview:numberbutton];
    
    UIButton *actionButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    actionButton.frame =CGRectMake(STATBUTTON_X, STATBUTTON_Y, STATBUTTON_WIDTH, STATBUTTON_HEIGHT);
    [actionButton addTarget:self action:@selector(maintStaffDetilView:) forControlEvents:UIControlEventTouchUpInside];
    [actionButton setTitle:@"cleaning done" forState:UIControlStateNormal];
    [actionButton setBackgroundColor:[UIColor whiteColor]];
    [maintBedView addSubview:actionButton];
    
    [self.view addSubview:maintBedView];
    
}

-(IBAction)maintStaffDetilView:(id)sender
{
    MaintStaffDetailView *maintStaff = [[MaintStaffDetailView alloc]initWithNibName:@"MaintStaffDetailView" bundle:nil];
    
    maintStaff.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:maintStaff animated:YES];
}




-(IBAction)listView:(id)sender
{
    BedListView *listView = [[BedListView alloc]initWithNibName:@"BedListView" bundle:nil];
    
    listView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:listView animated:YES];
}
-(void)clickSignOut
{
    MaintStaffLogin *maintLogin = [[MaintStaffLogin alloc]initWithNibName:@"MaintStaffLogin" bundle:nil];
    
    maintLogin.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:maintLogin animated:YES];
}

-(IBAction)message:(id)sender
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hello World!"
                                                      message:@"Are you sure that the bed is clean and it can be set as Available?"
                                                     delegate:nil
                                            cancelButtonTitle:@"Ok"
                                            otherButtonTitles:@"Cancel", nil];
    [message show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex // updating the status = 1(ready to occupy)
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Ok"])
    {
        
    }
    else if([title isEqualToString:@"Button 2"])
    {
        NSLog(@"Button 2 was selected.");
    }
    else if([title isEqualToString:@"Button 3"])
    {
        NSLog(@"Button 3 was selected.");
    }
}

@end
