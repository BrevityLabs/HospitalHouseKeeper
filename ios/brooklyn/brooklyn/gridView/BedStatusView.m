//
//  BedStatusView.m
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "BedStatusView.h"


static sqlite3 *database = nil;

//static sqlite3_stmt *selectStmt = nil;

@implementation BedStatusView

@synthesize maintBedView,listViewButton,gridViewButton,signOutButton;

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
    
    [self getMaintBedNumber];
    for(int i = 1; i< [bedNoArray count] ; i++) 
    {
        for (int j = 0; j<= i; j++) 
        {
            NSString *str=[bedNoArray objectAtIndex:j];
            [self drawBedAvailable:(258 * j) y: (i*250.0) width:204.8 height:150.0 bedId:str]   ;
        }
    }
    
        // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/*-(IBAction)gridView:(id)sender
{
    if (self.view ==nil)
    {
        
 
    [self getMaintBedNumber];
    for(int i = 1; i< [bedNoArray count] ; i++) 
    {
        for (int j = 0; j <=i; j++) 
        {
            NSString *str=[bedNoArray objectAtIndex:j];
            [self drawBedAvailable:(204.8 * j) y: (i*150.0) width:204.8 height:150.0 bedId:str]   ;
        }
    }
        
    }
}
*/

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
                   bedId : (NSString *) _bedId
{
    
    CGRect myRect = CGRectMake(x_pos, y_pos, _width, _height);
    
   maintBedView = [[UIView alloc]initWithFrame:myRect];
    
    maintBedView.backgroundColor = [UIColor yellowColor];
    
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(XOFFSET, YOFFSET, IMGWIDTH, IMGHEIGHT)];
    //    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(50.0, 50.0, 200.0, 136.0)];
    
    img.image=[UIImage imageNamed:@"bed_status2.png"];
    
    [maintBedView addSubview:img];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button addTarget:self action:@selector(maintStaffDetilView:) forControlEvents:UIControlEventTouchUpInside];
    
    button.frame=CGRectMake(BUTTON_X, BUTTON_Y, BUTTON_WIDTH, BUTTON_HEIGHT);
      [button setTitle:_bedId forState:UIControlStateNormal]; 
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];    
    
    [button setBackgroundColor:[UIColor yellowColor]]; 
    
    [maintBedView addSubview:button];
    
    [self.view addSubview:maintBedView];
    
}

-(IBAction)maintStaffDetilView:(id)sender
{
    MaintStaffDetailView *maintStaff = [[MaintStaffDetailView alloc]initWithNibName:@"MaintStaffDetailView" bundle:nil];
    
    maintStaff.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:maintStaff animated:YES];
}
-(NSString *)getDBPath1
{
    NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdir1 = [paths1 objectAtIndex:0];
    NSString *dbpath1 =[documentdir1 stringByAppendingPathComponent:@"BedInformation.sqlite"];
    NSFileManager *fileManager1=[NSFileManager defaultManager];
    NSError *error;
    BOOL success=[fileManager1 fileExistsAtPath:dbpath1];
    if (!success)
    {
        NSString *defaultpath1 = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"BedInformation.sqlite"];
        success=[fileManager1 copyItemAtPath:defaultpath1 toPath:dbpath1 error:&error];
        
        if (!success)
        {
            NSAssert1(0, @"failed to create writable database '%@'", [error localizedDescription]);
        }
    }
    
    NSLog(@"%@",dbpath1);
    return dbpath1;
    
    
}


-(void )getMaintBedNumber
{
    bedNoArray = [[NSMutableArray alloc]init];

    NSString *dbPath=[self getDBPath1];
    
    if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
    {
       // const char * sql1 = "select  BedNo from BedStaus where Status ='2'";
        sqlite3_stmt *selectStmt;
        
     const char *sql1 = "SELECT bedno FROM bedinformation WHERE status ='2' ";
     
        if (sqlite3_prepare_v2(database, sql1, -1, &selectStmt, NULL)==SQLITE_OK) 
        {
            while (sqlite3_step(selectStmt) == SQLITE_ROW)
            {
                [bedNoArray addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)]];
                               
                NSLog(@"%@",bedNoArray);
            }
        }
        
        
    }
    
     
    else
        
        sqlite3_close(database);
  
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
@end
