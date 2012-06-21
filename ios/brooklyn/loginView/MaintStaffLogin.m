//
//  MaintStaffLogin.m
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "MaintStaffLogin.h"



@implementation MaintStaffLogin

@synthesize password;
@synthesize userName;
@synthesize loginButton;

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

-(IBAction)loginClicked:(id)sender{
   NSString* post2 =@"cleaning";
    Employee* emp =[[Employee alloc]init];
    [emp getLoginDetails:userName.text];
    NSLog(@"emp.dept  :%@",emp.role);
    if ([post2 isEqualToString: emp.role]) 
   {
     BedStatusView *status = [[BedStatusView alloc]initWithNibName:@"BedStatusView" bundle:nil];
      
      status.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
       
      [self presentModalViewController:status animated:YES];
       
 }
   else
   {
       UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Department " message:@"please login in correct department " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
      [alertView show];
       
 }

}



@end
