//
//  MaintStaffLogin.m
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "MaintStaffLogin.h"


static sqlite3 *database=nil;

static sqlite3_stmt *addStmt = nil;

@implementation MaintStaffLogin

@synthesize txtPassword,txtUserName,loginButton;

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
    if ([self clickLogin])
    {
        BedStatusView *status = [[BedStatusView alloc]initWithNibName:@"BedStatusView" bundle:nil];
        
        status.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        [self presentModalViewController:status animated:YES];
        
    }
}

-(NSString *)getDBPath
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdir=[paths objectAtIndex:0];
    NSString *dbpath=[documentdir stringByAppendingPathComponent:@"brookelyn.sqlite"];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *error;
    BOOL success=[fileManager fileExistsAtPath:dbpath];
    if (!success)
    {
        NSString *defaultpath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"brookelyn.sqlite"];
        success=[fileManager copyItemAtPath:defaultpath toPath:dbpath error:&error];
        
        if (!success)
        {
            NSAssert1(0, @"failed to create writable database '%@'", [error localizedDescription]);
        }
    }
    
    NSLog(@"%@",dbpath);
    return dbpath;
    
    
}

-(BOOL)clickLogin
{
    usernameArray = [[NSMutableArray alloc]init];
    
    passwordArray = [[NSMutableArray alloc]init];
    NSString *dbpath=[self getDBPath];
    if (sqlite3_open([dbpath UTF8String], &database)==SQLITE_OK)
    {
        if (addStmt == nil)
        {   NSString* sql_statement = [NSString stringWithFormat: @"select loginID,password from User "] ;
            const char *sql= [sql_statement UTF8String];
            
            if (sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) ==SQLITE_OK)
            {
                while (sqlite3_step(addStmt)==SQLITE_ROW) 
                {
                    [usernameArray addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 0)]];
                    [passwordArray addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 1)]];
                    
                    NSLog(@"values in database%@",usernameArray);
                    NSLog(@"values in database%@",passwordArray);
                }
            }
            sqlite3_finalize(addStmt);
        } 
    }
    
    
    //TO DO: Check if there one record in the output
    // if yes, return true
    // else return false
    
    flg=0;
    
    if ([usernameArray count]==0) 
        flg=0; 
    else
    {
        for (int i=0;i<[usernameArray count];i++) 
        {
            NSString *usrName =[usernameArray objectAtIndex:i];
            NSString *pswd =[passwordArray objectAtIndex:i];
            if ([ txtUserName.text isEqualToString: usrName]) 
            {
                if ( [txtPassword.text isEqualToString:pswd]) 
                {
                 flg=1;
                break;
                }
            }
            
        }
    }   
    
    if (flg==1)
        return YES; 
    else
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Usename or password doesn't match " message:@"please enter correct username or password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return NO; 
    }
    
}









@end
