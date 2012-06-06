//
//  bed.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "bed.h"


static sqlite3_stmt *selectStmt = nil;
static sqlite3_stmt *selectStmt1 = nil;

@implementation bed
@synthesize bedNumber,bedStatus;


-(id) initWithBedId: (NSString*) _bedID {
    if (self = [super init]) {
        sqlite3 * database = [DBConnection connectionFactory ] ;
        NSString *nsatt = [NSString stringWithFormat:@"SELECT bedNo, status FROM Bed WHERE bid = '%@'",_bedID] ;
        const char *stmch=[nsatt UTF8String];
        
        if(sqlite3_prepare_v2(database, stmch, -1, &selectStmt1,NULL)==SQLITE_OK) {
            while (sqlite3_step(selectStmt1)==SQLITE_ROW) {
               bedNumber = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt1, 0)];
               bedStatus = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt1, 1)];
            }
        } else {
            NSLog(@"Class bed: Method initWithBedId::Query on Bed table failed.") ;
        }
        
    }
    return self ;
}

/* Select distinct tablename.field from <table1>
 Inner join <table2> on table1.field1 = table2.field1.
 Inner join <table3> on table2.field = table3.field1.*/
//"select bedstaff.empID from Employee Inner join bedstaff on Employee.empID=bedstaff.empID Inner join bed on bedstaff.bedID=bed.bid"
+(NSMutableArray *) getBedList {
    
    sqlite3 * database = [DBConnection connectionFactory ] ;
    
    NSMutableArray * bedArray=[[NSMutableArray alloc]init];
    
    NSString *nsatt = [NSString stringWithFormat:@"SELECT bid FROM Bed"];
    const char *stmch=[nsatt UTF8String];
    
    if(sqlite3_prepare_v2(database, stmch, -1, &selectStmt, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(selectStmt)==SQLITE_ROW) {
            NSString *bedID = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)];
            bed * temp =[[bed alloc]initWithBedId:bedID];

            [bedArray addObject:temp];
            
        }
    }
    sqlite3_finalize(selectStmt);
    return bedArray;  //an array of all the beds 
    
}


@end
