//
//  employee.m
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "employee.h"

@implementation employee

-(id) initWithEmployeeID : (int) empID {
    
}

+(BOOL) newEmployee: (int) empID 
              name : (NSString*) _name
              dept : (NSString*) _dept {
    
}


/*
 * When the employee details are change then it has to be updated in the DB
 */
-(BOOL) saveEmployee {
 
    //Create the SQL statement for Update
    //Execute the SQL statement
    //If done, return true; else false
    
}


-(BOOL) deleteEmployee {
    
}

-(NSString*) getLoginID {
    
}


@end
