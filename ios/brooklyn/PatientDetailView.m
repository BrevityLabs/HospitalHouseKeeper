//
//  PatientDetailView.m
//  brooklyn
//
//  Created by Maya on 04/06/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "PatientDetailView.h"

@implementation PatientDetailView

@synthesize txt_PatAdmitted,txt_PatBedNo,txt_PatDoctorName,txt_PatientAddress,txt_PatientID,txt_PatientName;
@synthesize  backButton,saveButton,dischargeButton;
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
    
    patientArray =[patient getPatientData];
    
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
