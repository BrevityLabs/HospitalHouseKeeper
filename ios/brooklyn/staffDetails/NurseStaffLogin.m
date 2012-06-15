//
//  NurseStaffLogin.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "NurseStaffLogin.h"


@implementation NurseStaffLogin

@synthesize txtNurUserName,loginNurButton;//txtNurPassword,

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

-(IBAction)nurLoginClicked:(id)sender
{
    NSString* post2 =@"nursing";
    Employee* emply =[[Employee alloc]init];
    [emply getLoginID:txtNurUserName.text];
    NSLog(@"emp.dept  :%@",emply.role);
    if ([post2 isEqualToString: emply.role]) 
    {
        BedView *bedview = [[BedView alloc]initWithNibName:@"BedView" bundle:nil];
        bedview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:bedview animated:YES];
    }
    else
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Department " message:@"please login in correct department " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
}


@end
