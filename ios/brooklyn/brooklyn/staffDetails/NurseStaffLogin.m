//
//  NurseStaffLogin.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NurseStaffLogin.h"

static sqlite3 *database=nil;

static sqlite3_stmt *addStmt = nil;


@implementation NurseStaffLogin

@synthesize txtNurPassword,txtNurUserName,loginNurButton;

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
-(IBAction)loginClicked:(id)sender
{
    //[self passwordValidation];
    
    [self clickLogin];
    
    [self goNextView];
}

-(NSString *)getDBPath
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdir=[paths objectAtIndex:0];
    NSString *dbpath=[documentdir stringByAppendingPathComponent:@"brooklyn.sqlite"];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *error;
    BOOL success=[fileManager fileExistsAtPath:dbpath];
    if (!success)
    {
        NSString *defaultpath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"brooklyn.sqlite"];
        success=[fileManager copyItemAtPath:defaultpath toPath:dbpath error:&error];
        
        if (!success)
        {
            NSAssert1(0, @"failed to create writable database '%@'", [error localizedDescription]);
        }
    }
    
    NSLog(@"%@",dbpath);
    return dbpath;
    
    
}

-(void)clickLogin
{
    
    NSMutableArray *values1 = [[NSMutableArray alloc]init];
    
    [values1 addObject:txtNurUserName.text];
    
    [values1 addObject:txtNurPassword.text];
    
    NSString *dbpath=[self getDBPath];
    
    if (sqlite3_open([dbpath UTF8String], &database)==SQLITE_OK)
    {
        if (addStmt == nil)
        {
            const char *sql="insert into user (loginid,password) values(?,?)";
            
            if (sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) !=SQLITE_OK)
            {
                
                NSAssert(0, @"error while creating sataement '%s'",sqlite3_errmsg(database));
            }
        }
        sqlite3_bind_text(addStmt, 1, [[values1 objectAtIndex:0]UTF8String], -1, SQLITE_TRANSIENT);
        
        sqlite3_bind_text(addStmt, 2, [[values1 objectAtIndex:1]UTF8String], -1, SQLITE_TRANSIENT);
        
        
        if (SQLITE_DONE !=sqlite3_step(addStmt)) 
            
            NSAssert1(0, @"error '%s'", sqlite3_errmsg(database));
        sqlite3_reset(addStmt);
        
    }
}


/*-(void)passwordValidation
 {
 NSString *pwd=[NSString stringWithString:txtPassword.text];
 int lngth=[pwd length]; 
 int minlength=6;
 
 NSString *regex = @"\\b([a-zA-Z0-9]+)\\b"; 
 
 NSPredicate * regextest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
 
 BOOL x= [regextest evaluateWithObject:pwd];
 
 if (lngth>=minlength) {
 NSLog(@"passoword length is enough");
 if (x==FALSE) {
 NSLog(@"Special charector check enabled");
 UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"No Special Charectors" message:@"please don't use special charectors" delegate:self cancelButtonTitle:@"Wanna Correct" otherButtonTitles:nil];
 [alert show];
 [txtPassword becomeFirstResponder];
 [self.view addSubview:txtPassword];
 }
 }
 else {
 UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Poor length" message:@"Password length must not be less than 8.." delegate:self cancelButtonTitle:@"Wanna Correct" otherButtonTitles:nil];
 [alert show];
 [txtPassword becomeFirstResponder];
 }
 
 }*/

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)goNextView
{
    PatientBedView *bedView = [[PatientBedView alloc]initWithNibName:@"PatientBedView" bundle:nil];
    
    bedView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentModalViewController:bedView animated:YES];
}


@end
