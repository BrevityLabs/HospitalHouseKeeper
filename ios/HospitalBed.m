//
//  HospitalBed.m
//  HospitalBedManagement
//
//  Created by Maya on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HospitalBed.h"
#import "Patient.h"

@implementation HospitalBed
@synthesize nextButton;
//static  int Occupied=0;
//static int underMaint=1;
//static int readyToOccy=2;

@synthesize bedView;

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
    
    [self.view setBackgroundColor:[UIColor blueColor]];
  //  for (int i=0; i<3;i++) 
    //{
    
   // [self changeStatus:i];
        
   // }
    for(int i = 1; i<= 4 ; i++) 
        for (int j = 0; j <= 3; j++) 
        {
            [self drawBedAvailable:(258 * j) y: (i*200.0) width:250.0 height:192.0 bedId:@"001"]   ;
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
///*status: bedData[i][j].status */]

-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
                   bedId : (NSString*) _bedId
{
    
    CGRect myRect = CGRectMake(x_pos, y_pos, _width, _height);
    
    bedView = [[UIView alloc]initWithFrame:myRect];
    
    bedView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(XOFFSET, YOFFSET, IMGWIDTH, IMGHEIGHT)];
    //    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(50.0, 50.0, 200.0, 136.0)];
    
    img.image=[UIImage imageNamed:@"1.jpg"];
    
    [bedView addSubview:img];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(LABEL_X, LABEL_Y, LABEL_WIDTH, LABEL_HEIGHT)];
    
    label.text = _bedId;
    
    label.textAlignment = UITextAlignmentCenter;
    
    label.textColor = [UIColor redColor];
    
    label.font = [UIFont boldSystemFontOfSize:25.0];
    
    label.backgroundColor = [UIColor whiteColor];
    
    [bedView addSubview:label];
    
    [self.view addSubview:bedView];
    
}

/*-(void)changeStatus:(int)_status
{
    if (_status ==Occupied)
    {
        for(int i = 1; i<= 4 ; i++) 
            for (int j = 0; j <= 3; j++)
          {
                [self drawBedAvailable:(258 * j) y: (i*200.0) width:250.0 height:192.0 bedId:@"001"]   ;
          }
    }
}*/
            

-(IBAction)next:(id)sender
{
    Patient *patient=[[Patient alloc]initWithNibName:@"Patient" bundle:nil];
    
    
}



@end
