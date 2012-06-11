//
//  staffDetail.m
//  brooklyn
//
//  Created by Maya on 04/06/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "staffDetail.h"

@implementation staffDetail
@synthesize Bedno;
@synthesize Empname;
@synthesize StatusTime;

/* Select distinct tablename.field from <table1>
 Inner join <table2> on table1.field1 = table2.field1.
 Inner join <table3> on table2.field = table3.field1.*/

+(NSMutableArray *)getAllData
{
    //To get maintenance staff name from databse
    sqlite3 *database =[DBConnection connectionFactory];
    sqlite3_stmt *selectStmt = nil;
    NSMutableArray *Bedarray=[[NSMutableArray alloc]init];
    //Bed.statusTimes
    NSString *nsatt=[NSString stringWithFormat:@"select Bed.bedno, Employee.name  from Employee Inner join BedStaff on Employee.empID=BedStaff.empID Inner join Bed on BedStaff.bedID=Bed.bedID"];
    
    const char *stmch=[nsatt UTF8String];
    
    if(sqlite3_prepare_v2(database, stmch, -1, &selectStmt,NULL)==SQLITE_OK)
    {
        
        while (sqlite3_step(selectStmt)==SQLITE_ROW)
        {
            NSString *bedno = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)];
            NSLog(@"%@",bedno);
            NSString *name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 1)];
            NSLog(@"%@",name);
//            NSString *statustime = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 2)];
//            NSLog(@"%@",statustime);
            staffDetail *maints =[[staffDetail alloc]init];
            maints.Bedno = bedno;
            maints.Empname =name;
           // maints.StatusTime =statustime;
            [Bedarray addObject:maints];
            
        }
    }
    sqlite3_finalize(selectStmt);
    
    return Bedarray;
    
}

@end
