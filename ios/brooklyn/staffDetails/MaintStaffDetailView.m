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

@synthesize txt_BedNo;
@synthesize txt_BedAssign;
@synthesize txt_WorkStatus;
@synthesize txt_Pedding;
@synthesize cleaningDoneButton;
@synthesize backButton;
 @synthesize  bedNoValue;
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
//[(UIButton *)sender.titleLabel.text]
- (void)viewDidLoad
{
    [super viewDidLoad];
  
    NSLog(@"obj is %@",bedNoValue);
    staffArray =[Employee getBedBeingCleaned:bedNoValue];
    for (int i=0; i<[staffArray count]; i++)
    {   
       
        Employee *emp =[staffArray objectAtIndex:i];
        NSLog(@"bed %@",bedNoValue);
        txt_BedNo.text = bedNoValue;
        txt_BedAssign.text =emp.name;
        txt_WorkStatus.text = @"Not started";
       txt_Pedding.text =emp.statusTime;
    }
    
    // Do any additional setup after loading the view from its nib.
}

-(void)getbedtitle:(NSString *)bednumber
{
    bedNoValue = bednumber;
    NSLog(@"str %@",bedNoValue);
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
-(IBAction)cleaningDone:(id)sender;
{
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
    if([title isEqualToString:@"Ok"])
    {
        [bed updateBedStatus:bedNoValue];
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Thanks"
                                                          message:@" The bed status has been changed to Available"
                                                         delegate:nil
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles:@"Cancel", nil];
        [message show];
        
    }
    
}


@end
