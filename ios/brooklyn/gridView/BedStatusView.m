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
    [self getGridView:5];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(IBAction)gridView:(id)sender {
    [self getGridView: 5];    
}

-(void) getGridView : (int) num_column {
    [self showHeader];

    bedNoArray = [Bed uncleanBeds]; //try getting the list of the objects instead of just their numbers :MB
    int num_rows = [bedNoArray count] / num_column ;
    int remainder = [bedNoArray count] % num_column ;
    num_rows = (remainder > 0) ? num_rows++ : num_rows ;
    for (int i = 0 ; i <= num_rows; i++)    {
        for (int j = 0; j < num_column; j++)  {
            if (j>=[bedNoArray count]) {
                break;
            }
            NSString *str= [bedNoArray objectAtIndex:(i * num_column + j)];
            Bed *bed = [[Bed alloc]initWithBedId:str];
            [self drawBedAvailable:(OFFSETX + (WIDTH * j)) y: (OFFSETY + (HEIGHT * i)) width:WIDTH height:HEIGHT bedNumber:bed.number ] ; 
        }
        
    }
}
// [self drawBedAvailable:(OFFSETX + (WIDTH * i)) y: (OFFSETY + (HEIGHT * j)) width:WIDTH height:HEIGHT bedNumber:bed.number] ; 

-(IBAction)signOut:(id)sender {
    MaintStaffLogin *maintLogin = [[MaintStaffLogin alloc]initWithNibName:@"MaintStaffLogin" bundle:nil];
    maintLogin.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:maintLogin animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //   Return YES for supported orientations
    
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        [self getGridView: 4] ;
    } else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        [self getGridView: 5] ;
    } 
    
	return YES;
}

-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
               bedNumber : (NSString *)_bedNumber  {

    CGRect myRect = CGRectMake(x_pos, y_pos, _width, _height);
    maintBedView = [[UIView alloc]initWithFrame:myRect];
    maintBedView.layer.borderColor = [UIColor blueColor].CGColor;
    maintBedView.layer.borderWidth = 3.0f; 
    [maintBedView setTag:(int)_bedNumber];
    NSLog(@"maint  %@",maintBedView.tag);
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

-(IBAction)maintStaffDetilView:(UIButton *) sender {
    NSString * bed =sender.titleLabel.text;
    number =bed;
    [self goDetailView];
}
-(void)goDetailView {
    MaintStaffDetailView *maintStaff = [[MaintStaffDetailView alloc]initWithNibName:@"MaintStaffDetailView" bundle:nil];
    maintStaff.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [maintStaff getbedtitle:number];
    [self presentModalViewController:maintStaff animated:YES];
    
}
-(IBAction)imageDetailView:(UIButton *)sender {
    NSString * bed =sender.titleLabel.text;
    number =bed;
    [self goDetailView];
}

-(IBAction)listView:(id)sender {
    BedListView *listView = [[BedListView alloc]initWithNibName:@"BedListView" bundle:nil];
    listView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:listView animated:YES];
}

-(IBAction)cleaningDone:(UIButton *)sender { 
    NSString * bed =sender.titleLabel.text;
    number = bed;
    bednumber =(int)[sender currentTitle];
    NSLog(@"tag %@",bednumber);
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                      message:@"Are you sure that the bed is clean and it can be set as Available?"
                                                     delegate:self
                                            cancelButtonTitle:@"Ok"
                                            otherButtonTitles:@"Cancel", nil];
    [message show];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex  {  // updating the status = 3(ready to occupy) 

    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    Bed *bed =[[Bed alloc]init];
    if([title isEqualToString:@"Ok"]){
        [bed updateBedStatus:number];
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Thanks"
                                                          message:@" The bed status has been changed to Available"
                                                         delegate:nil
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles:@"Cancel", nil];
        [message show];
        
    }
    for (maintBedView in [self.view subviews]) {
        [maintBedView setHidden:YES];
        [self.view setHidden:NO];
    }
    [self.view reloadInputViews];
    [bedNoArray removeLastObject];
    [bedNoArray removeAllObjects];
    [self  getGridView:5];
    
}
-(void)showHeader { 
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(IMG_X, IMG_Y, IMG_WIDTH, IMG_HEIGHT)];
    imageView.image =[UIImage imageNamed:@"loginheader.png"];
    [self.view addSubview:imageView];
    
    UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(LAB1_X, LAB1_Y, LAB1_WIDTH, LAB1_HEIGHT)];
    label1.text =@"Cleaning Station";
    [label1 setTextAlignment:UITextAlignmentCenter];
    [label1 setTextColor:[UIColor blackColor]];
    [label1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:label1];
    
    UILabel *label2 =[[UILabel alloc]initWithFrame:CGRectMake(LAB2_X, LAB2_Y, LAB2_WIDTH, LAB2_HEIGHT)];
    label2.text =@"    Bed Status";
    [label2 setFont: [UIFont fontWithName:@"Arial" size:25.0]];
    [label2 setTextColor:[UIColor blackColor]];
    [label2 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:label2];
    
    listViewButton =[UIButton buttonWithType:UIButtonTypeCustom];
    listViewButton.frame =CGRectMake(LISTBTN_X,LISTBTN_Y, LISTBTN_WIDTH, LISTBTN_HEIGHT);
    [listViewButton setBackgroundImage:[UIImage imageNamed:@"icon_list.png"] forState:UIControlStateNormal];
    [listViewButton addTarget:self action:@selector(listView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:listViewButton];
    
    gridViewButton=[UIButton buttonWithType:UIButtonTypeCustom];
    gridViewButton.frame =CGRectMake(GRIDBTN_X,GRIDBTN_Y, GRIDBTN_WIDTH, GRIDBTN_HEIGHT);
    [gridViewButton  setBackgroundImage:[UIImage imageNamed:@"icon_tile.png"] forState:UIControlStateNormal];
    [gridViewButton  addTarget:self action:@selector(gridView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gridViewButton] ;
    
    signOutButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    signOutButton .frame =CGRectMake(SIGNOUTBTN_X,SIGNOUTBTN_Y, SIGNOUTBTN_WIDTH,SIGNOUTBTN_HEIGHT);
    [signOutButton setTitle:@"Sign out" forState:UIControlStateNormal];
    [signOutButton  addTarget:self action:@selector(signOut:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signOutButton] ;
    
}
@end
