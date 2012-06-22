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
    NSString* post1 =@"cleaning";
    
    Array =[Employee getLoginID];
    for (int j=0;j<[Array count]; j++)
    {
        NSLog(@"userarray  %@",[Array objectAtIndex:j]);
        NSString *str =[Array objectAtIndex:j];
        Employee *emp = [[Employee alloc]initWithLoginID:str];
        NSString* UseName =emp.loginID;
        NSLog(@"username  %@",UseName);
        NSString* PassWord =emp.password;
        NSLog(@"password %@",PassWord);
        NSString* Role =emp.role;
        NSLog(@"role  %@",Role);

        if ([Array count]==0) {
            roleFlag =0;
        }
        if ([Role isEqualToString:post1]) {
            if ([userName.text isEqualToString:UseName]) {
                if ([password.text isEqualToString:PassWord]) {
                    roleFlag =1;
                    break;
                }
            }
        }
        
    }
    if(roleFlag ==1)
    {
        NSLog(@"Login successful");
        BedStatusView *statusView = [[BedStatusView alloc]initWithNibName:@"BedStatusView" bundle:nil];
        statusView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:statusView animated:YES];
    }
    else{
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Usename or password doesn't match " message:@"please enter correct username or password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }

    
    
}
//Employee* emp =[[Employee alloc]init];
//[emp getLoginDetails:userName.text];
//NSLog(@"emp.dept  :%@",emp.role);
//if ([post2 isEqualToString: emp.role]) 
//{
//    BedStatusView *status = [[BedStatusView alloc]initWithNibName:@"BedStatusView" bundle:nil];
//    
//    status.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    
//    [self presentModalViewController:status animated:YES];
//    
//}
//else
//{
//    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Department " message:@"please login in correct department " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    [alertView show];
//    
//}



@end
