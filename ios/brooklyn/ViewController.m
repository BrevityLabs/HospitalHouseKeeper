//
//  ViewController.m
//  brooklyn
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize nurseStaffButton,maintStaffButton,staticButton;

-(IBAction)maintStaffButton:(id)sender
{
    MaintStaffLogin *maintLog = [[MaintStaffLogin alloc]initWithNibName:@"MaintStaffLogin" bundle:nil];
    
    maintLog.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:maintLog animated:YES];
    
}

-(IBAction)nurseStaffButton:(id)sender
{
    NurseStaffLogin *nurseStaff = [[NurseStaffLogin alloc]initWithNibName:@"NurseStaffLogin" bundle:nil];
    
    nurseStaff.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:nurseStaff animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
