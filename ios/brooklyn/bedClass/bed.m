//
//  bed.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "bed.h"


@implementation Bed
@synthesize bedId;
@synthesize number;
@synthesize status;
@synthesize type;
@synthesize empId;
@synthesize bedNo;
@synthesize bedstatus;


-(id) initWithBedId: (NSString*) _bedId {
    if (self = [super init]) {
        sqlite3_stmt * _selectStmt ;
        sqlite3 * database = [DBConnection connectionFactory ] ;
        NSString *nsatt = [NSString stringWithFormat:@"SELECT bedNo, status, type FROM Bed WHERE bedID = '%@'", _bedId] ;
        const char *stmch=[nsatt UTF8String];
        if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt,NULL) == SQLITE_OK) {
            while (sqlite3_step(_selectStmt)==SQLITE_ROW) {
                bedId   = _bedId ;
                number  = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
                status  = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 1)];
                type    = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 2)];
            }
        } else {
            NSLog(@"Class bed: Method initWithBedId::Query on Bed table failed.") ;
        }
        
    }
    return self ;
}


/*
 *  Static (class) method to get the list of bed available in the hospital. By traversing, one can get hold
 *  of various bed objects.
 */

+(NSMutableArray *) getBedList {
    sqlite3_stmt * _selectStmt ;
    
    sqlite3 * database = [DBConnection connectionFactory ] ;
    
    NSMutableArray * _bedArray=[[NSMutableArray alloc]init];
    
    NSString *nsatt = [NSString stringWithFormat:@"SELECT bedID FROM Bed"];
    const char *stmch=[nsatt UTF8String];
    
    if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(_selectStmt)==SQLITE_ROW) {
            NSString * _bedId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
             [_bedArray addObject: _bedId];
            Bed * _bed = [[Bed alloc] initWithBedId: _bedId];
              NSLog(@"%@",_bed);
            }
    }
    sqlite3_finalize(_selectStmt);
    return _bedArray;  //an array of all the beds 
    
}


/*
 *  Static (class) method to get the list Ids of the beds available in the hospital. By traversing, one can get hold
 *  of various bed objects.
 */
+(NSMutableArray *) getCleanBedNoList {//for getting the bedid of beds which are ready for cleaning.
    sqlite3_stmt * _selectStmt ;
    
    sqlite3 * database = [DBConnection connectionFactory ] ;
    
    NSMutableArray * _bedNoArray=[[NSMutableArray alloc]init];
    
    NSString *nsatt = [NSString stringWithFormat:@"SELECT bedID FROM Bed where status ='2'"];
    const char *stmch=[nsatt UTF8String];
    
    if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(_selectStmt)==SQLITE_ROW) {
            NSString * _bedid = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
            [_bedNoArray addObject: _bedid];
            Bed * _bedID = [[Bed alloc] initWithBedId: _bedid];
            NSLog(@"BEDID %@",_bedID);

        }
    }
    sqlite3_finalize(_selectStmt);
    return _bedNoArray;  //an array of all the bed Id
}

-(NSMutableArray *)getCleaningStaffName // for getting the cleaning staff name.
{
    sqlite3 *database = [DBConnection connectionFactory];
    static sqlite3_stmt *selectStmt = nil;
    NSMutableArray *array =[[NSMutableArray alloc]init];
    NSString *nsatt=[NSString stringWithFormat:@"select Bed.bedID,Bed.bedno,Employee.name,Employee.empID from Employee Inner join BedStaff on Employee.empID=BedStaff.empID Inner join Bed on BedStaff.bedID=Bed.bedID"];
    const char *stmch=[nsatt UTF8String];
    if(sqlite3_prepare_v2(database, stmch, -1, &selectStmt,NULL)==SQLITE_OK)
    {
        while (sqlite3_step(selectStmt)==SQLITE_ROW)
        {
            NSString *eno = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)];
            NSString *ebedno = [NSString stringWithUTF8String:(char*)sqlite3_column_text(selectStmt, 1)];
            NSString *ename = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 2)];
            NSString *empid = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 3)];
            Bed* maint =[[Bed alloc]init];
            Employee *emp = [[Employee alloc]init];
            maint.bedId = eno;
            maint.bedNo = ebedno;
            emp.name = ename;
            maint.empId =empid;
            [array addObject:maint];
        }
    }
    sqlite3_finalize(selectStmt);
    return array;
}

-(NSString* )updateBedStatus:(NSString *)_bednumber
{
    sqlite3 *database = [DBConnection connectionFactory];
    sqlite3_stmt*  _updateStmt;
    NSString* nsatt = [NSString stringWithFormat:@"UPDATE Bed SET status ='3' WHERE bedNo ='%@'",_bednumber];
    const char*  sql = [nsatt UTF8String];
    if (sqlite3_prepare_v2(database, sql, -1, &_updateStmt, NULL)!=SQLITE_OK) {
        NSAssert1(0, @"Error while creating update statement. '%s'", sqlite3_errmsg(database)); 
    }
    sqlite3_bind_int(_updateStmt, 1, bedstatus);
    if (SQLITE_DONE != sqlite3_step(_updateStmt)){
        NSAssert1(0, @"Error while updating. '%s'", sqlite3_errmsg(database));
    }
    sqlite3_reset(_updateStmt);
    return bedId;
}


@end
