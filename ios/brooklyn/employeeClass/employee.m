//
//  employee.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import "employee.h"

@implementation employee

-(id) initWithEmployeeID : (int) empID {
    //Get handled to DB connection
    //Make query in Employee table with employee ID
    //Populate this class properties with the values
    return ;
}

+(BOOL) newEmployee: (int) empID 
              name : (NSString*) _name
              dept : (NSString*) _dept {
    // get handle to DB connection
    // create a sql query with employee ID, name and department
    // execute the create sql query
    
    return false ;
}


/*
 * When the employee details are change then it has to be updated in the DB
 */
-(BOOL) saveEmployee {
 
    //Create the SQL statement for Update
    //Execute the SQL statement
    //If done, return true; else false
    
    return false ;
}


-(BOOL) deleteEmployee {
    
    return false ;
}

-(NSString*) getLoginID {
    
    return ;
}


@end
