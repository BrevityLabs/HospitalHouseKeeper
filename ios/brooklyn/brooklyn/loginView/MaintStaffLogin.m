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
    [self clickLogin];
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
    //[self clickLogin];
    
    for (int i=0;i<[values count];i++) 
    {
        NSLog(@"values ff %@",values);
        
        if ([[values objectAtIndex:i] isEqualToString:txtUserName.text]) 
        {
            NSLog(@"values ii %@",values);
            BedStatusView *status = [[BedStatusView alloc]initWithNibName:@"BedStatusView" bundle:nil];
            
            status.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            
            [self presentModalViewController:status animated:YES];
            
        }
        else{
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Usename password doent match"
                                                            message:@"please enter correct username or password" delegate:nil 
                                                  cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        }
        
    }
    
                        
//            return NO;  
    

    //[self passwordValidation];
   // [self clickLogin];
//    if ([self clickLogin])
//    {
//        BedStatusView *status = [[BedStatusView alloc]initWithNibName:@"BedStatusView" bundle:nil];
//        
//        status.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        
//        [self presentModalViewController:status animated:YES];
//
//    }
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
   values  = [[NSMutableArray alloc]init];

   // NSMutableArray *values1 = [[NSMutableArray alloc]init];

    //NSString *values1 ;
  //  NSString *str2 ;  
    //values1 =txtUserName.text;
    
  //  [values1 addObject:txtUserName.text];

    NSString *dbpath=[self getDBPath];
    
    if (sqlite3_open([dbpath UTF8String], &database)==SQLITE_OK)
    {
        if (addStmt == nil)
        {   NSString* sql_statement = [NSString stringWithFormat: @"select loginID from User "] ;
            const char *sql= [sql_statement UTF8String];
            
            if (sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) ==SQLITE_OK)
            {
                while (sqlite3_step(addStmt)==SQLITE_ROW) 
                {
                    [values addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 0)]];
                     
                    NSLog(@"values in database%@",values);
                     //[values addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(addStmt, 1)]];
                   // str2  =[NSString stringWithFormat:values];
                    [values copy];                 
                       
                }
            }
            sqlite3_finalize(addStmt);
        
        }
    }
        
        //TO DO: Check if there one record in the output
        // if yes, return true
        // else return false
<<<<<<< HEAD
 
    
  
          return YES;
=======
        
    }
    return  YES;
>>>>>>> ttt
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




@end
