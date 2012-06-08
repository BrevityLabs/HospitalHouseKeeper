//
//  BedView.m
//  brooklyn
//
//  Created by Maya on 04/06/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
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
//    bed * objbed = [[bed alloc] init] ;
    bedArray = [Bed getBedList];
    NSString *str1 = @"1";
    NSString *str2 = @"2";
    NSString *str3 = @"3";
    int j=0;
    int i=1;
    while (i>j) {
        for (; j<[bedArray count]; j++) {
                Bed* b3 =[bedArray objectAtIndex:j];
                
                NSLog(@"bed %@",b3.number);
                
                [self drawnurBedAvailable:(208*j) y:(i*168.0) width:205 height:145 bedId:b3.number];
                if ([b3.status isEqualToString:str1]) 
                {
                    bedImgButton = [UIButton buttonWithType:UIButtonTypeCustom ];
                     CGRect rect = CGRectMake(BEDIMGXOFFSET,BEDIMGYOFFSET,BEDIMGWIDTH,BEDIMGHEIGHT);
                    bedImgButton.frame = rect;
                    [bedImgButton setBackgroundImage:[UIImage imageNamed: @"bed_status1.png"] forState:UIControlStateNormal];
                    [bedImgButton addTarget:self action:@selector(patientDetailview:) forControlEvents:UIControlEventTouchUpInside];
                    [nurseBedView addSubview:bedImgButton];
                                        
                }
                else if([b3.status isEqualToString:str2])
                {
                    bedImgButton = [UIButton buttonWithType:UIButtonTypeCustom ];
                    CGRect rect = CGRectMake(BEDIMGXOFFSET,BEDIMGYOFFSET,BEDIMGWIDTH,BEDIMGHEIGHT);
                    bedImgButton.frame = rect;
                    [bedImgButton setBackgroundImage:[UIImage imageNamed: @"bed_status2.png"] forState:UIControlStateNormal];
                    [bedImgButton addTarget:self action:@selector(patientDetailview:) forControlEvents:UIControlEventTouchUpInside];
                    [nurseBedView addSubview:bedImgButton];
                     
                }
                
                else if([b3.status isEqualToString:str3]) 
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



-(IBAction)messageView:(id)sender
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"The bed no 004 is under maintenance. "
                                                        message:@"The status will update automatically when it is ready." 
                                                       delegate:self 
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
    [alertView show];
   }
@end
