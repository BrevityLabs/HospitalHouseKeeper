//
//  BedStatusView.m
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "BedStatusView.h"

//static sqlite3_stmt *selectStmt = nil;

@implementation BedStatusView

@synthesize maintBedView;
@synthesize listViewButton;
@synthesize gridViewButton;
@synthesize signOutButton;
@synthesize numberbutton;
@synthesize actionButton;
@synthesize imgButton;
@synthesize bednumber;
@synthesize status;
@synthesize label;
@synthesize bedID;
@synthesize number;
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

//#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self getGridView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(IBAction)gridView:(id)sender
{
    [self getGridView];    
}

-(void)getGridView
{
    int j=0;
    bedNoArray = [Bed getCleanBedNoList];
    int i=1;
    while (i>j) {
        for (; j<[bedNoArray count]; j++) {
            NSString *str=[bedNoArray objectAtIndex:j];
            Bed *bed =[[Bed alloc]initWithBedId:str];
            bednumber = bed.number;
            status =bed.status;
            bedID =bed.bedId;
            [self drawBedAvailable:(300 * j) y: (i*150.0) width:250.0 height:200.0 bedNumber:bednumber] ;
     //       beds =[NSMutableArray arrayWithObject:bedID];
            }
        i++;
          }
    


}
-(IBAction)signOut:(id)sender
{
    [self clickSignOut];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
               bedNumber : (NSString *)_bedNumber
{
    
    CGRect myRect = CGRectMake(x_pos, y_pos, _width, _height);
    maintBedView = [[UIView alloc]initWithFrame:myRect];
    maintBedView.layer.borderColor = [UIColor blueColor].CGColor;
    maintBedView.layer.borderWidth = 3.0f; 
    // bednumber=_bedId;
      
    imgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    imgButton.frame = CGRectMake(IMGBTNXOFFSET, IMGBTNYOFFSET, IMGBTNWIDTH, IMGBTNHEIGHT);
    [imgButton setBackgroundImage:[UIImage imageNamed:@"bed_status2.png"] forState:UIControlStateNormal];
    [imgButton addTarget:self action:@selector(imageDetailView:) forControlEvents:UIControlEventTouchUpInside];
    [imgButton setTitle:_bedNumber forState:UIControlStateNormal];
    [imgButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [maintBedView addSubview:imgButton];
    
    numberbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [numberbutton addTarget:self action:@selector(maintStaffDetilView:) forControlEvents:UIControlEventTouchUpInside];
    
    numberbutton.frame=CGRectMake(NUMBUTTON_X,NUMBUTTON_Y, NUMBUTTON_WIDTH, NUMBUTTON_HEIGHT);
    [numberbutton setTitle:_bedNumber forState:UIControlStateNormal]; 
    
    [numberbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];    
    
    [numberbutton setBackgroundColor:[UIColor whiteColor]]; 
    
    [maintBedView addSubview:numberbutton];
    
    actionButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    actionButton.frame =CGRectMake(STATBUTTON_X, STATBUTTON_Y, STATBUTTON_WIDTH, STATBUTTON_HEIGHT);
    [actionButton addTarget:self action:@selector(cleaningDone:) forControlEvents:UIControlEventTouchUpInside];
    
   
     NSString *str = [NSString stringWithFormat:@"cleaning done "];//for bednumber %@",number];
    [actionButton setTitle:str forState:UIControlStateNormal];
      
    [actionButton setBackgroundColor:[UIColor whiteColor]];
    [maintBedView addSubview:actionButton];
    
   
    [self.view addSubview:maintBedView];
    
}        

-(IBAction)maintStaffDetilView:(UIButton *) sender
{
    // (myInstanceVariable = [sender.titleLabel.text copy];)
          NSString * bed =sender.titleLabel.text;
    number =bed;
    NSLog(@"bednumber %@",number);
    [self goDetailView];


}
-(void)goDetailView
{
    MaintStaffDetailView *maintStaff = [[MaintStaffDetailView alloc]initWithNibName:@"MaintStaffDetailView" bundle:nil];
    
    maintStaff.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
     [maintStaff getbedtitle:number];
    [self presentModalViewController:maintStaff animated:YES];
   

}
-(IBAction)imageDetailView:(UIButton *)sender
{
    NSString * bed =sender.titleLabel.text;
    number =bed;
    NSLog(@"bednumber %@",number);
    
    [self goDetailView];
}

-(IBAction)listView:(id)sender
{
    BedListView *listView = [[BedListView alloc]initWithNibName:@"BedListView" bundle:nil];
    
    listView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:listView animated:YES];
}
-(void)clickSignOut
{
    MaintStaffLogin *maintLogin = [[MaintStaffLogin alloc]initWithNibName:@"MaintStaffLogin" bundle:nil];
    
    maintLogin.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:maintLogin animated:YES];
}

-(IBAction)cleaningDone:(id)sender
{ 
//     NSMutableArray *str =[Bed getCleanBedNoList];
//    for (int i=0; i<[bedNoArray count]; i++) {
//         NSLog(@"bedid %@",[str objectAtIndex:i]);
//        
//          NSLog(@"bedid %@",bednumber);
//        if ([label.text isEqualToString:[str objectAtIndex:i]]){
              UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                              message:@"Are you sure that the bed is clean and it can be set as Available?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Ok"
                                                    otherButtonTitles:@"Cancel", nil];
            [message show];
     
    
//        }
//    }
       
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex // updating the status = 3(ready to occupy)
{
   
 
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    Bed *bed =[[Bed alloc]init];
    
    NSLog(@"number is %@",bednumber);
    if([title isEqualToString:@"Ok"])
    {
        [bed updateBedStatus:bednumber];
        NSLog(@"number is %@",bednumber);
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Thanks"
                                                          message:@" The bed status has been changed to Available"
                                                         delegate:nil
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles:@"Cancel", nil];
        [message show];
        
    }
    
}

@end
