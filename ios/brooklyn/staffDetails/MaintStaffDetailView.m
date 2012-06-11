//
//  MaintStaffDetailView.m
//  HospitalBedManagementSystem
//
//  Created by Maya on 24/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "MaintStaffDetailView.h"

#import "BedStatusView.h"

@implementation MaintStaffDetailView

@synthesize txt_BedNo,txt_BedAssign,txt_WorkStatus,txt_Pedding;

@synthesize backButton,cleaningDoneButton;

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
    
    staffArray =[staffDetail getAllData];
    for (int i=0; i<[staffArray count]; i++)
    {
        
        staffDetail *emp =[staffArray objectAtIndex:i];
        
        txt_BedNo.text = emp.Bedno;
        
        txt_BedAssign.text =emp.Empname;
        
        txt_WorkStatus.text = @"Not started";
        txt_Pedding.text =emp.StatusTime;
    }
    
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

-(IBAction)Back:(id)sender
{
    [self BackClicked];
}

-(void)BackClicked
{
    BedStatusView *bedstatus = [[BedStatusView alloc]initWithNibName:@"BedStatusView" bundle:nil];
    
    bedstatus.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:bedstatus animated:YES];
    
}
@end
