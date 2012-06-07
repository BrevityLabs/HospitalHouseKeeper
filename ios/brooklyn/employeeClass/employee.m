//
//  employee.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "employee.h"

static sqlite3 *database =nil;

@implementation Employee

@synthesize employeeID;
@synthesize name;
@synthesize dept;
@synthesize loginID;
@synthesize post;

-(id) initWithEmployeeID :(NSString*) empID {
    //Get handled to DB connection
    //Make query in Employee table with employee ID
    //Populate this class properties with the values
    if (self = [super init]) {
        
        sqlite3* database = [DBConnection connectionFactory ] ;
        static sqlite3_stmt* _selectStmt = nil;
        //NSString* _bedId ;
        
        NSString *nsatt = [NSString stringWithFormat:@"SELECT name,dept FROM Employee WHERE empID = '%@'",empID] ;
        const char* stmch=[nsatt UTF8String];
        
        if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt,NULL) == SQLITE_OK) {
            while (sqlite3_step(_selectStmt)==SQLITE_ROW) {
                employeeID   = empID ;
                name         = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
                dept         = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 1)];
                [self getEmployeeID:empID];
                
            }
        } else {
            NSLog(@"Class bed: Method initWithBedId::Query on Bed table failed.") ;
        }
        
    }
    
    return self ;
    
    
}

+(NSMutableArray*) getEmployeeList  {
    
    sqlite3*  database = [DBConnection connectionFactory ] ;
    sqlite3_stmt*  _selectStmt ;
    
    NSMutableArray* patientArray=[[NSMutableArray alloc]init];
    
    NSString* nsatt = [NSString stringWithFormat:@"SELECT A.patientID FROM BedPatient A, BedStaff B where A.bedID = B.bedID"];
    const char* stmch=[nsatt UTF8String];
    
    if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt, NULL) == SQLITE_OK) {
        
        while (sqlite3_step(_selectStmt)==SQLITE_ROW) {
            NSString* patientId = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
            Employee* temp =[[Employee alloc] initWithEmployeeID:patientId];
            
            [patientArray addObject: temp];
            
        }
    }
    sqlite3_finalize(_selectStmt);
    return patientArray;  //an array of all the beds 
    
}

-(NSString*) getEmployeeID: (NSString*) _employeeId {
    sqlite3_stmt* _selectStmt ;
    
    if (employeeID == NULL) {
        NSString* nsatt = [NSString stringWithFormat:@"SELECT A.empID FROM PatientStaff A, BedPatient B where A.patientID = B.patientID AND A.empID = %@", _employeeId];
        const char* stmch=[nsatt UTF8String];
        if(sqlite3_prepare_v2(database, stmch, -1, &_selectStmt, NULL) == SQLITE_OK) {
            while (sqlite3_step(_selectStmt) == SQLITE_ROW) { 
                //...
                employeeID = [NSString stringWithUTF8String:(char *)sqlite3_column_text(_selectStmt, 0)];
            }
        }        
    }
    sqlite3_finalize(_selectStmt);
    return employeeID ;
}

+(BOOL) newEmployee: (NSString*)_empID 
              name : (NSString*) _name
              dept : (NSString*) _dept {
    // get handle to DB connection
    // create a sql query with employee ID, name and department
    // execute the create sql query
    
    NSMutableArray*  empArray = [[NSMutableArray alloc]init];
    [empArray addObject:_empID];
    [empArray addObject:_name];
    [empArray addObject:_dept];
    
    sqlite3* database = [DBConnection connectionFactory ] ;
    sqlite3_stmt* _insertStmt ;
    if (_insertStmt ==nil)
    {
        const char* sql="insert into Employee(empID,name,dept) values(?,?,?)";
        if(sqlite3_prepare_v2(database, sql, -1, &_insertStmt, NULL)!=SQLITE_OK)
        {
            NSAssert1(0,@"error while creating statement.'%s'",sqlite3_errmsg(database));
        }
    }
    
    sqlite3_bind_text(_insertStmt, 1, [[empArray objectAtIndex:0]UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(_insertStmt, 2, [[empArray objectAtIndex:1]UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(_insertStmt, 3, [[empArray objectAtIndex:2]UTF8String], -1, SQLITE_TRANSIENT);
    
    if(SQLITE_DONE!=sqlite3_step(_insertStmt))
        NSAssert1(0,@"error.'%s'",sqlite3_errmsg(database));
    sqlite3_reset(_insertStmt);
    
    return TRUE;
}


/*
 * When the employee details are change then it has to be updated in the DB
 */
-(BOOL) saveEmployee {
    
    //Create the SQL statement for Update
    //Execute the SQL statement
    //If done, return true; else false
    sqlite3*  database =[DBConnection connectionFactory];
    sqlite3_stmt*  _updateStmt;
    if (_updateStmt == nil)
    {
        NSString* nsatt = [NSString stringWithFormat:@"UPDATE Employee set name = %@ ,dept =%@ WHERE empID = %@",name,dept,employeeID];
        const char*  sql = [nsatt UTF8String];
        if (sqlite3_prepare_v2(database, sql, -1, &_updateStmt, NULL)==SQLITE_OK) 
            NSAssert1(0, @"Error while creating update statement. '%s'", sqlite3_errmsg(database));      
    }
    sqlite3_bind_text(_updateStmt, 1, [name UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(_updateStmt, 2, [dept UTF8String], -1, SQLITE_TRANSIENT);
    sqlite3_bind_text(_updateStmt, 3, [employeeID UTF8String], -1, SQLITE_TRANSIENT);
    
    if (SQLITE_DONE != sqlite3_step(_updateStmt))
        NSAssert1(0, @"Error while updating. '%s'", sqlite3_errmsg(database));
    sqlite3_reset(_updateStmt);
    return false ;
}


-(BOOL) deleteEmployee {
    sqlite3*  database = [DBConnection connectionFactory];
    sqlite3_stmt* _deleteStmt;
    if (_deleteStmt ==nil)
    {
        NSString* nsatt = [NSString stringWithFormat:@"DELETE FROM Employee where empID = %@",employeeID];
        const char *sql = [nsatt UTF8String];
		if(sqlite3_prepare_v2(database, sql, -1, &_deleteStmt, NULL) != SQLITE_OK)
			NSAssert1(0, @"Error while creating delete statement. '%s'", sqlite3_errmsg(database));
    }
    
    //When binding parameters, index starts from 1 and not zero.
    sqlite3_bind_text(_deleteStmt, 1, [employeeID UTF8String], -1, SQLITE_TRANSIENT);
	
	if (SQLITE_DONE != sqlite3_step(_deleteStmt)) 
		NSAssert1(0, @"Error while deleting. '%s'", sqlite3_errmsg(database));
	
	sqlite3_reset(_deleteStmt);


    return false ;
}

-(NSString*) getLoginID 
{
    
}
@end
