//
//  patient.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "patient.h"

static sqlite3 *database =nil;

@implementation Patient
@synthesize patientId;
@synthesize name;
@synthesize address;
@synthesize cell;
@synthesize bedNo ;

/*
 *  Constructor with the patient identifier as the argument. It gets all the information 
 *  from the DB table and builds the object.
 */
-(id) initWithPatientId: (NSString*) _patientId {
    if (self = [super init]) {
        
        sqlite3 * database = [DBConnection connectionFactory ] ;
        static sqlite3_stmt* _selectStmt = nil;
        NSString* _bedId ;
        
        NSString *nsatt = 
            [NSString stringWithFormat:@"SELECT name, address, cellNo FROM Patient WHERE patientID = '%@'",_patientId] ;
        const char *stmch=[nsatt UTF8String];
        
        if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt,NULL) == SQLITE_OK) {
            while (sqlite3_step(_selectStmt)==SQLITE_ROW) {
                patientId   = _patientId ;
                name        = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
                address     = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 1)];
                cell        = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 2)];
                [self getAllocatedBedNo: _patientId ];
                
            }
        } else {
            NSLog(@"Class bed: Method initWithBedId::Query on Bed table failed.") ;
        }
        
    }
    return self ;
    
}

/*
 *  This class method returns the entire list of patients currently admitted. The patients in the Patient 
 *  Master who are not currently occupying any bed would not be shown.
 */

+(NSMutableArray *) getPatientList {
    
    sqlite3 * database = [DBConnection connectionFactory ] ;
    sqlite3_stmt* _selectStmt ;

    NSMutableArray * patientArray=[[NSMutableArray alloc]init];
    
    NSString *nsatt = [NSString stringWithFormat:@"SELECT A.patientID FROM Patient A, BedPatient B where A.PatientID = B.PatientID"];
    const char *stmch=[nsatt UTF8String];
    
    if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(_selectStmt)==SQLITE_ROW) {
            NSString * patientId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
            Patient * temp =[[Patient alloc] initWithPatientId: patientId];
            
            [patientArray addObject: temp];
            
        }
    }
    sqlite3_finalize(_selectStmt);
    return patientArray;  //an array of all the beds 
    
}

/*
 *  Method to retrieve Bed No from Bed Master if Bed ID is passed as an argument.
 *  This method also modifies the object property bedId.
 */
-(NSString*) getAllocatedBedNo: (NSString*) _patientId {
    sqlite3_stmt* _selectStmt ;
    
    if (bedNo == NULL) {
        NSString *nsatt = [NSString stringWithFormat:@"SELECT A.bedNo FROM Bed A, BedPatient B where A.bedID = B.bedID AND B.patientID = %@", _patientId];
        const char *stmch=[nsatt UTF8String];
        if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt, NULL) == SQLITE_OK) {
            while (sqlite3_step(_selectStmt) == SQLITE_ROW) { 
                //...
                 bedNo = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
            }
        }        
    }
    sqlite3_finalize(_selectStmt);
    return bedNo ;
}


@end
