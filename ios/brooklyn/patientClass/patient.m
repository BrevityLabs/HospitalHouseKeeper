//
//  patient.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "patient.h"

static sqlite3 *database =nil;

static sqlite3_stmt *selectStmt = nil;

@implementation patient
+(NSString *)createDB
{
    NSArray
    *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,
                                               YES);
    
    NSString *documentsdir=[paths objectAtIndex:0];
    NSString *dbpath=[documentsdir
                      stringByAppendingPathComponent:@"brookelyn.sqlite"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    NSError *error;
    
    BOOL success=[fileManager fileExistsAtPath:dbpath];
    
    if(!success)
    {
        NSString *defaultpath=[[[NSBundle
                                 mainBundle]resourcePath]stringByAppendingPathComponent:@"brookelyn.sqlite"];
        
        success=[fileManager copyItemAtPath:defaultpath toPath:dbpath
                                      error:&error];
        
        if(!success)
            NSAssert1(0,@"failed to create writable database.'%@'",
                      [error localizedDescription]);
        
    }
    NSLog(@"%@",dbpath);
    return dbpath;
}


/* Select distinct tablename.field from <table1>
 Inner join <table2> on table1.field1 = table2.field1.
 Inner join <table3> on table2.field = table3.field1.*/


//@"select Bed.bid,Bed.bedno, Employee.name from Employee Inner join BedStaff on Employee.empID=BedStaff.empID Inner join Bed on BedStaff.bedID=Bed.bid"

+(NSMutableArray *)getPatientData
{
    NSMutableArray *Bedarray=[[NSMutableArray alloc]init];
    
    NSString *dbpath=[self createDB];
    
    if(sqlite3_open([dbpath UTF8String], &database)==SQLITE_OK)
    {
        
        NSString *nsatt=[NSString stringWithFormat:@"SELECT Patient.PatientID,Patient.name,Patient.Address,Bed.bedno from Patient Inner join BedPatient on Patient.patientID = BedPatient.patientID Inner join Bed on BedPatient.patientID = Bed.bid"];
        
        const char *stmch=[nsatt UTF8String];
        
        if(sqlite3_prepare_v2(database, stmch, -1, &selectStmt,NULL)==SQLITE_OK)
        {
            
            while (sqlite3_step(selectStmt)==SQLITE_ROW)
            {
                NSString *pid = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)];
                NSLog(@"%@",pid);
                
                NSString *pname = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 1)];
                NSLog(@"%@",pname);
                
                NSString *pAddr = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 2)];
                NSLog(@"%@",pAddr);
                
                NSString *pBedNo = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 3)];
                NSLog(@"%@",pname);
              patientVar *p1 =[[patientVar alloc]init];
                p1.patId =pid;
                p1.patName =pname;
                p1.patAddrs =pAddr;
                p1.patBedNo =pBedNo;
                
                [Bedarray addObject:p1];
                
            }
        }
        sqlite3_finalize(selectStmt);
    }
    return Bedarray;
    
}


@end
