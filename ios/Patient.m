//
//  Patient.m
//  HospitalBedManagement
//
//  Created by Maya on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Patient.h"

static sqlite3 *database=nil;

static sqlite3_stmt *addStmt=nil;

@implementation Patient

@synthesize txt_Address,txt_BedNo,txt_Name,txt_CellNo;

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
}

-(NSString*)getdbPath
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

-(void)allocateBed
{
    NSMutableArray *values = [[NSMutableArray alloc]init];
    
    [values addObject:txt_Name.text];
    
    [values addObject:txt_Address.text];
    
    [values addObject:txt_CellNo.text];
    
    NSString *dbpath=[self getdbPath];
    
    if (sqlite3_open([dbpath UTF8String], &database)==SQLITE_OK)
    {
        if (addStmt==nil)
        {
            const char *sql="insert into Patient(Name,Address,CellNo)values(?,?,?)";
            
            if (sqlite3_prepare_v2(database, sql, -1, &addStmt, NULL)!=SQLITE_OK)
            {
                
                NSAssert(0, @"error while creating sataement '%s'",sqlite3_errmsg(database));
            }
        }
        sqlite3_bind_text(addStmt, 1, [[values objectAtIndex:0]UTF8String], -1, SQLITE_TRANSIENT);
        
        sqlite3_bind_text(addStmt, 2, [[values objectAtIndex:1]UTF8String], -1, SQLITE_TRANSIENT);
        
        sqlite3_bind_text(addStmt, 2, [[values objectAtIndex:2]UTF8String], -1, SQLITE_TRANSIENT);
        
        if (SQLITE_DONE !=sqlite3_step(addStmt)) 
            
            NSAssert1(0, @"error '%s'", sqlite3_errmsg(database));
        sqlite3_reset(addStmt);
            
      }
        
}

@end
