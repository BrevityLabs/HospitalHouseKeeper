//
//  MaintList.m
//  brooklyn
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "MaintList.h"

static sqlite3 *database =nil;

static sqlite3_stmt *selectStmt = nil;

@implementation MaintList

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


//"select bedstaff.empID from Employee Inner join bedstaff on Employee.empID=bedstaff.empID Inner join bed on bedstaff.bedID=bed.bid"
+(NSMutableArray *)getAllData
{
    NSMutableArray *Bedarray=[[NSMutableArray alloc]init];
    
    NSString *dbpath=[self createDB];
    
    if(sqlite3_open([dbpath UTF8String], &database)==SQLITE_OK)
    {
        
        NSString *nsatt=[NSString stringWithFormat:@"select Bed.bid,Bed.bedno, Employee.name from Employee Inner join BedStaff on Employee.empID=BedStaff.empID Inner join Bed on BedStaff.bedID=Bed.bid"];
        
        const char *stmch=[nsatt UTF8String];
        
        if(sqlite3_prepare_v2(database, stmch, -1, &selectStmt,NULL)==SQLITE_OK)
        {
            
            while (sqlite3_step(selectStmt)==SQLITE_ROW)
            {
                NSString *eno = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)];
                NSLog(@"%@",eno);
                NSString *ebedno = [NSString stringWithUTF8String:(char*)sqlite3_column_text(selectStmt, 1)];
                NSLog(@"%@",ebedno);
                NSString *ename = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 2)];
                NSLog(@"%@",ename);
                MaintDB  *maint =[[MaintDB alloc]init];
                maint.Eid = eno;
                maint.Bedno = ebedno;
                maint.Ename =ename;
                
                [Bedarray addObject:maint];
                
           }
        }
        sqlite3_finalize(selectStmt);
    }
    return Bedarray;
    
}



@end
