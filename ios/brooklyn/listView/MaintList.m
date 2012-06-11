//
//  MaintList.m
//  brooklyn
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "MaintList.h"

@implementation MaintList

@synthesize Empid;
@synthesize Bedno;
@synthesize Empname;


/* Select distinct tablename.field from <table1>
 Inner join <table2> on table1.field1 = table2.field1.
 Inner join <table3> on table2.field = table3.field1.*/


//"select bedstaff.empID from Employee Inner join bedstaff on Employee.empID=bedstaff.empID Inner join bed on bedstaff.bedID=bed.bid"
+(NSMutableArray *)getAllData
{
    sqlite3 *database = [DBConnection connectionFactory];
    static sqlite3_stmt *selectStmt = nil;
    
    NSMutableArray *array =[[NSMutableArray alloc]init];
    NSString *nsatt=[NSString stringWithFormat:@"select Bed.bedID,Bed.bedno, Employee.name from Employee Inner join BedStaff on Employee.empID=BedStaff.empID Inner join Bed on BedStaff.bedID=Bed.bedID"];
    
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
            MaintList *maint =[[MaintList alloc]init];
            maint.Empid = eno;
            maint.Bedno = ebedno;
            maint.Empname = ename;
            [array addObject:maint];
            
            
        }
    }
    sqlite3_finalize(selectStmt);
    
    return array;
    
}



@end
