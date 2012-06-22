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
    [self getGridView:4];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(IBAction)gridView:(id)sender
{
    [self getGridView: 5];    
}

-(void) getGridView : (int) num_column
{
    
    bedNoArray = [Bed getCleanBedNoList]; //try getting the list of the objects instead of just their numbers :MB
    
    //int j=1; //initialized to 1 because this var has been used in layout design
    //     NSLog(@"arraycount %d",[bedNoArray count]);
    //    NSLog(@"numcol %d",num_column);
    //    int num_rows = [bedNoArray count] / num_column ;
    //     //NSLog(@"numrow %d",num_rows);
    //    int remainder = [bedNoArray count] % num_column ;
    //     //NSLog(@"rem %d",remainder);
    //    num_rows = (remainder > 0) ? num_rows++ : num_rows ;
    int num_rows;
    int remainder;
    NSLog(@"arraycount %d",[bedNoArray count]);
    if ([bedNoArray count]>= num_column) {
        num_rows = [bedNoArray count] / num_column ;
        remainder = [bedNoArray count] % num_column ;
        num_rows = (remainder > 0) ? num_rows++ : num_rows ;
    }
    
    else{
        num_rows = num_column /[bedNoArray count]; 
        NSLog(@"numrow %d",num_rows);
        remainder = num_column %[bedNoArray count];
        NSLog(@"REminder %d",remainder);
        num_rows = (remainder > 0) ? num_rows : num_rows++ ;
    }
    
    
    for (int i = 0 ; i < num_rows; i++)    {
        for (int j = 0; j < num_column; j++)  {
            if (j>=[bedNoArray count]) {
                break;
            }
            
            NSString *str= [bedNoArray objectAtIndex:(i * num_column + j)];
            Bed *bed = [[Bed alloc]initWithBedId:str];
            [self drawBedAvailable:(OFFSETX + (WIDTH * j)) y: (OFFSETY + (HEIGHT * i)) width:WIDTH height:HEIGHT bedNumber:bed.number bedID:bed.bedId] ;  
        }
        
    }
}
// [self drawBedAvailable:(OFFSETX + (WIDTH * i)) y: (OFFSETY + (HEIGHT * j)) width:WIDTH height:HEIGHT bedNumber:bed.number] ; 

-(IBAction)signOut:(id)sender
{
    [self clickSignOut];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    
    //    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
    //        [self getGridView: 4] ;
    //    } else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
    //        [self getGridView: 5] ;
    //    } 
    
	return YES;
}

-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
               bedNumber : (NSString *)_bedNumber
                   bedID : (NSString *)_bedid
{
    
    CGRect myRect = CGRectMake(x_pos, y_pos, _width, _height);
    maintBedView = [[UIView alloc]initWithFrame:myRect];
    maintBedView.layer.borderColor = [UIColor blueColor].CGColor;
    maintBedView.layer.borderWidth = 3.0f; 
    maintBedView.tag = (int)_bedid;
    
    imgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    imgButton.frame = CGRectMake(IMGBTNXOFFSET, IMGBTNYOFFSET, IMGBTNWIDTH, IMGBTNHEIGHT);
    [imgButton setBackgroundImage:[UIImage imageNamed:@"bed_status2.png"] forState:UIControlStateNormal];
    [imgButton addTarget:self action:@selector(imageDetailView:) forControlEvents:UIControlEventTouchUpInside];
    [imgButton setTitle:_bedNumber forState:UIControlStateNormal];
    imgButton.titleLabel.hidden =YES;
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
    [actionButton setBackgroundImage:[UIImage imageNamed:@"Status.jpg"] forState:UIControlStateNormal];
    [actionButton setTitle:_bedNumber forState:UIControlStateNormal];
    [actionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];    
    actionButton.titleLabel.hidden =YES;
    [maintBedView addSubview:actionButton];
    
    [self.view addSubview: maintBedView];
    
}        

-(IBAction)maintStaffDetilView:(UIButton *) sender
{
    NSString * bed =sender.titleLabel.text;
    number =bed;
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

-(IBAction)cleaningDone:(UIButton *)sender
{ 
    NSString * bed =sender.titleLabel.text;
    number = bed;
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
        [bed updateBedStatus:number];
        [self hideView:number];
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Thanks"
                                                          message:@" The bed status has been changed to Available"
                                                         delegate:nil
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles:@"Cancel", nil];
        [message show];
        
    }
    
}

-(void) hideView:(NSString*) _bednumber
{
    if (self.maintBedView.hidden == NO){ 
        // self.maintBedView.hidden = YES;
        [self.maintBedView reloadInputViews];
        
        
    }
    
}
@end
