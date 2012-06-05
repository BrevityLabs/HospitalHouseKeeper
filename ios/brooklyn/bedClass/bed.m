//
//  bed.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "bed.h"

static sqlite3 *database =nil;

static sqlite3_stmt *selectStmt = nil;


@implementation bed

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
        
        NSString *nsatt=[NSString stringWithFormat:@"SELECT bedno,status FROM Bed"];
        
        const char *stmch=[nsatt UTF8String];
        
        if(sqlite3_prepare_v2(database, stmch, -1, &selectStmt,NULL)==SQLITE_OK)
        {
            
            while (sqlite3_step(selectStmt)==SQLITE_ROW)
            {
                NSString *bno = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)];
                NSLog(@"%@",bno);
                
                NSString *bstatus = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 1)];
                NSLog(@"%@",bstatus);
                BedVar *b1 =[[BedVar alloc]init];
                b1.bedNumber =bno;
                b1.bedStatus =bstatus;
               [Bedarray addObject:b1];
                
            }
        }
        sqlite3_finalize(selectStmt);
    }
    return Bedarray;
    
}


@end
