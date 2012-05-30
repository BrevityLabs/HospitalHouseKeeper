//
//  MaintList.m
//  brooklyn
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
                      stringByAppendingPathComponent:@"brooklyn.sqlite"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    NSError *error;
    
    BOOL success=[fileManager fileExistsAtPath:dbpath];
    
    if(!success)
    {
        NSString *defaultpath=[[[NSBundle
                                 mainBundle]resourcePath]stringByAppendingPathComponent:@"brooklyn.sqlite"];
        
        success=[fileManager copyItemAtPath:defaultpath toPath:dbpath
                                      error:&error];
        
        if(!success)
            NSAssert1(0,@"failed to create writable database.'%@'",
                      [error localizedDescription]);
        
    }
    NSLog(@"%@",dbpath);
    return dbpath;
}

+(NSMutableArray *)getAllData
{
    
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    NSString *dbpath=[self createDB];
    
    if(sqlite3_open([dbpath UTF8String], &database)==SQLITE_OK)
    {
        
        NSString *nsatt=[NSString stringWithFormat:@"select bedID, bedno from bed where status = '2'"];
        
        const char *stmch=[nsatt UTF8String];
        
        if(sqlite3_prepare_v2(database, stmch, -1, &selectStmt,NULL)==SQLITE_OK)
        {
            
            while (sqlite3_step(selectStmt)==SQLITE_ROW)
            {
                NSString *eno = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)];
                NSString *ename = [NSString stringWithUTF8String:(char*)sqlite3_column_text(selectStmt, 1)];
                
                MaintDB  *maint =[[MaintDB alloc]init];
                maint.Eid = eno;
                maint.Bedno = ename;
                
                [array addObject:maint];
            }
        }
        sqlite3_finalize(selectStmt);
    }
    return array;
}

@end
