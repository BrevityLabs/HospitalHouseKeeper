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
            Bed * _bed = [[Bed alloc] initWithBedId: _bedId];
            
            [_bedArray addObject: _bed];
            
        }
    }
    sqlite3_finalize(_selectStmt);
    return _bedArray;  //an array of all the beds 
    
}


/*
 *  Static (class) method to get the list Ids of the beds available in the hospital. By traversing, one can get hold
 *  of various bed objects.
 */
+(NSMutableArray *) getCleanBedNoList {
    sqlite3_stmt * _selectStmt ;
    
    sqlite3 * database = [DBConnection connectionFactory ] ;
    
    NSMutableArray * _bedNoArray=[[NSMutableArray alloc]init];
    
    NSString *nsatt = [NSString stringWithFormat:@"SELECT bedNo FROM Bed where status ='2'"];//for getting the bedid of beds which are ready for claning.
    const char *stmch=[nsatt UTF8String];
    
    if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(_selectStmt)==SQLITE_ROW) {
            NSString * _bedno = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
            [_bedNoArray addObject: _bedno];
            
        }
    }
    sqlite3_finalize(_selectStmt);
    return _bedNoArray;  //an array of all the bed Id
    
}



@end
