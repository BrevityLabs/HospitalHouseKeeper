//
//  BedView.m
//  brooklyn
//
//  Created by Maya on 04/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BedView.h"

@implementation BedView
@synthesize nurseBedView,nurGridViewButton,nurListViewButton;
@synthesize bedNoButton,bedImgButton;
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
    nurseBedNoArray =[bed getAllValues];
    NSString *str1 = @"1";
    NSString *str2 = @"2";
    NSString *str3 = @"3";
    
    int i=1;
    int j=0;
    while (i<[nurseBedNoArray count])
    {
        for (; j<[nurseBedNoArray count]; j++)
        {
                   BedVar *b3 =[nurseBedNoArray objectAtIndex:j];
                
                NSLog(@"bed %@",b3.bedNumber);
                
                [self drawnurBedAvailable:(208*j) y:(i*168.0) width:205 height:145 bedId:b3.bedNumber];
                if ([b3.bedStatus isEqualToString:str1]) 
                {
                    bedImgButton = [UIButton buttonWithType:UIButtonTypeCustom ];
                     CGRect rect = CGRectMake(BEDIMGXOFFSET,BEDIMGYOFFSET,BEDIMGWIDTH,BEDIMGHEIGHT);
                    bedImgButton.frame = rect;
                    [bedImgButton setBackgroundImage:[UIImage imageNamed: @"bed_status1.png"] forState:UIControlStateNormal];
                    [bedImgButton addTarget:self action:@selector(patientDetailview:) forControlEvents:UIControlEventTouchUpInside];
                    [nurseBedView addSubview:bedImgButton];
                                        
                }
                else if([b3.bedStatus isEqualToString:str2])
                {
                    bedImgButton = [UIButton buttonWithType:UIButtonTypeCustom ];
                    CGRect rect = CGRectMake(BEDIMGXOFFSET,BEDIMGYOFFSET,BEDIMGWIDTH,BEDIMGHEIGHT);
                    bedImgButton.frame = rect;
                    [bedImgButton setBackgroundImage:[UIImage imageNamed: @"bed_status2.png"] forState:UIControlStateNormal];
                    [bedImgButton addTarget:self action:@selector(patientRegView:) forControlEvents:UIControlEventTouchUpInside];
                    [nurseBedView addSubview:bedImgButton];
                     
                }
                
                else if([b3.bedStatus isEqualToString:str3]) 
                {
                    
                    bedImgButton = [UIButton buttonWithType:UIButtonTypeCustom ];
                    CGRect rect = CGRectMake(BEDIMGXOFFSET,BEDIMGYOFFSET,BEDIMGWIDTH,BEDIMGHEIGHT);
                    bedImgButton.frame = rect;
                    [bedImgButton setBackgroundImage:[UIImage imageNamed: @"bed_status3.png"] forState:UIControlStateNormal];
                     [bedImgButton addTarget:self action:@selector(messageView:) forControlEvents:UIControlEventTouchUpInside];
                    [nurseBedView addSubview:bedImgButton];
 
                    
                }
        }
        i++;
    }
         

       
            
            //drawnurBedAvailable:(258 * j) y: (i*166.0) width:204.8 height:140.0 bedId:b1.bedNumber]   ;

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

-(void) drawnurBedAvailable:(float)x_pos
                          y:(float)y_pos 
                      width:(float)_width 
                     height:(float)_height 
                      bedId:(NSString *)_bedId
{
   
    
    
    CGRect myRect = CGRectMake(x_pos, y_pos, _width, _height);
    
    nurseBedView = [[UIView alloc]initWithFrame:myRect];
    nurseBedView.backgroundColor = [UIColor yellowColor];
    bedNoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [bedNoButton addTarget:self action:@selector(patientDetailview:) forControlEvents:UIControlEventTouchUpInside];
    
    bedNoButton.frame=CGRectMake(BEDNOBUTTON_X, BEDNOBUTTON_Y, BEDNOBUTTON_WIDTH, BEDNOBUTTON_HEIGHT);
    [bedNoButton setTitle:_bedId forState:UIControlStateNormal]; 
    
    [bedNoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];    
    
    [bedNoButton setBackgroundColor:[UIColor yellowColor]]; 
    
    [nurseBedView addSubview:bedNoButton];
       
    [self.view addSubview:nurseBedView];
    
}


-(IBAction)patientDetailview:(id)sender
{
    PatientDetailView *patient = [[PatientDetailView alloc]initWithNibName:@"PatientDetailView" bundle:nil];
    patient.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:patient animated:YES];
}

-(IBAction)patientRegView:(id)sender
{
    PatientRegnView *regn = [[PatientRegnView alloc]initWithNibName:@"PatientRegnView" bundle:nil];
    regn.modalTransitionStyle =UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:regn animated:YES];
}

-(IBAction)messageView:(id)sender
{
    MaintenanceView *maintV = [[MaintenanceView alloc]initWithNibName:@"MaintenanceView" bundle:nil];
    maintV.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:maintV animated:YES];
}
@end
