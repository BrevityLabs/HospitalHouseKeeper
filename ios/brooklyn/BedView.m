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
@synthesize button,img;
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
    nurBedNoArray =[bed getAllData];
    
    
    NSLog(@"array %@",nurBedNoArray);
    BedVar *b2 =[[BedVar alloc]init]; 
    for(int i = 1; i< [nurBedNoArray count] ; i++) 
    {
        for (int j = 0; j<i; j++) 
        {
            
            
            
            NSLog(@"bed %@",b2.bedNumber);
            
            [self drawnurBedAvailable:(208*j) y:(i*168.0) width:205 height:145 bedId:b2.bedNumber];
            
            
            //drawnurBedAvailable:(258 * j) y: (i*166.0) width:204.8 height:140.0 bedId:b1.bedNumber]   ;
        }
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
    BedVar *b2 =[[BedVar alloc]init]; 
    NSString *str1 = @"1";
    NSString *str2 = @"2";
    NSString *str3 = @"3";
    
    
    CGRect myRect = CGRectMake(x_pos, y_pos, _width, _height);
    
    nurseBedView = [[UIView alloc]initWithFrame:myRect];
    nurseBedView.backgroundColor = [UIColor yellowColor];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button addTarget:self action:@selector(patientDetailview:) forControlEvents:UIControlEventTouchUpInside];
    
    button.frame=CGRectMake(BEDBUTTON_X, BEDBUTTON_Y, BEDBUTTON_WIDTH, BEDBUTTON_HEIGHT);
    [button setTitle:_bedId forState:UIControlStateNormal]; 
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];    
    
    [button setBackgroundColor:[UIColor yellowColor]]; 
    
    [nurseBedView addSubview:button];
    if ([b2.bedStatus isEqualToString:str1]) 
    {
        img = [[UIImageView alloc]initWithFrame:CGRectMake(BIMGXOFFSET, BIMGYOFFSET, BIMGIMGWIDTH, BIMGIMGHEIGHT)];
        
        img.image=[UIImage imageNamed:@"bed_status1.png"];
        
        [nurseBedView addSubview:img];
        
        
    }
    else if([b2.bedStatus isEqualToString:str2])
    {
        
        
        img = [[UIImageView alloc]initWithFrame:CGRectMake(BIMGXOFFSET, BIMGYOFFSET, BIMGIMGWIDTH, BIMGIMGHEIGHT)];
        
        img.image=[UIImage imageNamed:@"bed_status2.png"];
        
        [nurseBedView addSubview:img];
        
        
    }
    
    else if([b2.bedStatus isEqualToString:str3]) 
    {
        
        img = [[UIImageView alloc]initWithFrame:CGRectMake(BIMGXOFFSET, BIMGYOFFSET, BIMGIMGWIDTH, BIMGIMGHEIGHT)];
        
        img.image=[UIImage imageNamed:@"bed_status3.png"];
        
        [nurseBedView addSubview:img];
        
        
    }
    
    [self.view addSubview:nurseBedView];
    
}


-(IBAction)patientDetailview:(id)sender
{
    PatientDetailView *patient = [[PatientDetailView alloc]initWithNibName:@"PatientDetailView" bundle:nil];
    patient.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:patient animated:YES];
}

@end
