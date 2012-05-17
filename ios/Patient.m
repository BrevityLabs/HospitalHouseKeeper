//
//  Patient.m
//  HospitalBedManagement
//
//  Created by Maya on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Patient.h"


#import "HospitalBed.h"


static sqlite3 *database=nil;

static sqlite3_stmt *addStmt=nil;

static sqlite3_stmt *updateStmt=nil;

@implementation Patient

@synthesize txt_Address,txt_BedNo,txt_Name,txt_CellNo;

@synthesize label_BedNo;

@synthesize savebutton,cancelbutton;

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
    [self getBedNo];
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

-(IBAction)save:(id)sender
{
    [self allocateBed];
    [self updateBedStatus];
    
    [self SaveClicked];
}
-(NSString *)getdbPath
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdir=[paths objectAtIndex:0];
    NSString *dbpath=[documentdir stringByAppendingPathComponent:@"PatientDetails.sqlite"];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *error;
    BOOL success=[fileManager fileExistsAtPath:dbpath];
    if (!success)
    {
        NSString *defaultpath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"PatientDetails.sqlite"];
        success=[fileManager copyItemAtPath:defaultpath toPath:dbpath error:&error];
        
        if (!success)
        {
            NSAssert1(0, @"failed to create writable database '%@'", [error localizedDescription]);
        }
    }
    
    NSLog(@"%@",dbpath);
    return dbpath;
}

-(NSString *)getdbPath1
{
    NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentdir1=[paths1 objectAtIndex:0];
    NSString *dbpath1 = [documentdir1 stringByAppendingPathComponent:@"BedStatus.sqlite"];
    NSFileManager *fileManager1=[NSFileManager defaultManager];
    NSError *error;
    BOOL success=[fileManager1 fileExistsAtPath:dbpath1];
    if (!success)
    {
        NSString *defaultpath1 = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"BedStatus.sqlite"];
        success=[fileManager1 copyItemAtPath:defaultpath1 toPath:dbpath1 error:&error];
        
        if (!success)
        {
            NSAssert1(0, @"failed to create writable database '%@'", [error localizedDescription]);
        }
    }
    
    NSLog(@"%@",dbpath1);
    return dbpath1;
}

-(void)allocateBed
{
    NSMutableArray *values1 = [[NSMutableArray alloc]init];
    
    [values1 addObject:txt_Name.text];
    
    [values1 addObject:txt_Address.text];
    
    [values1 addObject:txt_CellNo.text];

    [values1 addObject:txt_BedNo.text];
    
    NSString *dbpath=[self getdbPath];
    
    if (sqlite3_open([dbpath UTF8String], &database)==SQLITE_OK)
    {
        if (addStmt == nil)
        {
            const char *sql="insert into Patient(Patientname,Address,CellNo,BedId)values(?,?,?,?)";
            
            if (sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL) !=SQLITE_OK)
            {
                
                NSAssert(0, @"error while creating sataement '%s'",sqlite3_errmsg(database));
            }
        }
        sqlite3_bind_text(addStmt, 1, [[values1 objectAtIndex:0]UTF8String], -1, SQLITE_TRANSIENT);
        
        sqlite3_bind_text(addStmt, 2, [[values1 objectAtIndex:1]UTF8String], -1, SQLITE_TRANSIENT);
        
        sqlite3_bind_text(addStmt, 3, [[values1 objectAtIndex:2]UTF8String], -1, SQLITE_TRANSIENT);
        
        sqlite3_bind_text(addStmt, 4, [[values1 objectAtIndex:3]UTF8String], -1, SQLITE_TRANSIENT);
    
        if (SQLITE_DONE !=sqlite3_step(addStmt)) 
            
            NSAssert1(0, @"error '%s'", sqlite3_errmsg(database));
        sqlite3_reset(addStmt);
            
      }
    
   
}

-(void)getBedNo
 {
 NSMutableArray *array=[[NSMutableArray alloc]init];
 
 NSString *dbPath=[self getdbPath1];
 
 if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK)
 {
 //NSString *BedNo;
 const char * sql1 = "select  BedNo from BedInformation where Status ='3'";
 sqlite3_stmt *selctStmt;
 
 //NSString *bedVacant=[NSString stringWithFormat:@"select  BedNo from BedInformation where status !='1'"];
 
 //const char *bedstmt=[bedVacant UTF8String];
 
 if (sqlite3_prepare_v2(database, sql1, -1, &selctStmt, NULL)==SQLITE_OK) 
 {
 while (sqlite3_step(selctStmt)==SQLITE_ROW)
 {
 [array addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selctStmt, 0)]];
 
 label_BedNo.text=[array objectAtIndex:0];
     
  txt_BedNo.text=self.label_BedNo.text;
 
 NSLog(@"%@",array);
 }
 }
 
 }
 
 else 
 
 sqlite3_close(database);
 }


-(void)SaveClicked
{
    HospitalBed *hospBed = [[HospitalBed alloc]initWithNibName:@"HospitalBed" bundle:nil];
    hospBed.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:hospBed animated:YES];
}

  
-(void)updateBedStatus
 {
     NSMutableArray *BedStatus = [[NSMutableArray alloc]init];
 
     [BedStatus addObject:txt_BedNo.text];
     
     NSString *dbpath1=[self getdbPath1];
     
     if (sqlite3_open([dbpath1 UTF8String], &database) == SQLITE_OK)
     {
         if ( updateStmt == nil)
         {
             NSString *sqlStatement = [NSString stringWithFormat:@"update BedInformation  set Status ='1' where BedNo = '%@'",txt_BedNo.text];
             const char *sql2 = [sqlStatement UTF8String];             
             if (sqlite3_prepare_v2(database, sql2, -1, &updateStmt, NULL) != SQLITE_OK)
             {
                 
                 NSAssert(0, @"error while creating sataement '%s'",sqlite3_errmsg(database));
             }
         }
         sqlite3_bind_text(updateStmt, 1, [[BedStatus objectAtIndex:0]UTF8String], -1, SQLITE_TRANSIENT);
         
                  
         if (SQLITE_DONE !=sqlite3_step(updateStmt)) 
             
             NSAssert1(0, @"error '%s'", sqlite3_errmsg(database));
         sqlite3_reset(updateStmt);
         
     }
      
 }
    
  
 
        
    
    
@end
