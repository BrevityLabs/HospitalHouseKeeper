//
//  NurseStaffLogin.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "NurseStaffLogin.h"


@implementation NurseStaffLogin

@synthesize txtNurUserName,loginNurButton;//txtNurPassword,

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

-(IBAction)nurLoginClicked:(id)sender
{
    
    NSString* post2 =@"nursing";
    Employee* emply =[[Employee alloc]init];
     [emply getLoginID:txtNurUserName.text];
    //emp.loginID =txtUserName.text;
    NSLog(@"emp.dept  :%@",emply.role);
    if ([post2 isEqualToString: emply.role]) 
    {
        BedView *bedview = [[BedView alloc]initWithNibName:@"BedView" bundle:nil];
        bedview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentModalViewController:bedview animated:YES];
    }
     else
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Department " message:@"please login in correct department " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }

}

//-(NSString *)getDbPath
//{
//    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentdir=[paths objectAtIndex:0];
//    NSString *dbpath=[documentdir stringByAppendingPathComponent:@"brookelyn.sqlite"];
//    NSFileManager *fileManager=[NSFileManager defaultManager];
//    NSError *error;
//    BOOL success=[fileManager fileExistsAtPath:dbpath];
//    if (!success)
//    {
//        NSString *defaultpath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"brookelyn.sqlite"];
//        success=[fileManager copyItemAtPath:defaultpath toPath:dbpath error:&error];
//        
//        if (!success)
//        {
//            NSAssert1(0, @"failed to create writable database '%@'", [error localizedDescription]);
//        }
//    }
//    
//    NSLog(@"%@",dbpath);
//    return dbpath;
//    
//    
//}
//
//-(BOOL)clickLogin
//{
//    nurUsernameArray = [[NSMutableArray alloc]init];
//    
//    nurPasswordArray = [[NSMutableArray alloc]init];
//    NSString *dbpath=[self getDbPath];
//    if (sqlite3_open([dbpath UTF8String], &database)==SQLITE_OK)
//    {
//        if (selectStmt == nil)
//        {   NSString* sql_statement = [NSString stringWithFormat: @"select loginID,password from User "] ;
//            const char *sql= [sql_statement UTF8String];
//            
//            if (sqlite3_prepare_v2(database, sql, -1, &selectStmt, NULL) ==SQLITE_OK)
//            {
//                while (sqlite3_step(selectStmt)==SQLITE_ROW) 
//                {
//                    [nurUsernameArray addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)]];
//                    [nurPasswordArray addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 1)]];
//                    
//                    NSLog(@"values in database%@",nurUsernameArray);
//                    NSLog(@"values in database%@",nurPasswordArray);
//                }
//            }
//            sqlite3_finalize(selectStmt);
//        } 
//    }
//    
//    
//    //TO DO: Check if there one record in the output
//    // if yes, return true
//    // else return false
//    
//    flg=0;
//    
//    if ([nurUsernameArray count]==0) 
//        flg=0; 
//    else
//    {
//        for (int i=0;i<[nurUsernameArray count];i++) 
//        {
//            NSString *usrName =[nurUsernameArray objectAtIndex:i];
//            NSString *pswd =[nurPasswordArray objectAtIndex:i];
//            if ([ txtNurUserName.text isEqualToString: usrName]) 
//            {
//                if ( [txtNurPassword.text isEqualToString:pswd]) 
//                {
//                    flg=1;
//                    break;
//                }
//            }
//            
//        }
//    }   
//    
//    if (flg==1)
//        return YES; 
//    else
//    {
//        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Usename or password doesn't match " message:@"please enter correct username or password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alertView show];
//        return NO; 
//    }
//    
//}


@end
