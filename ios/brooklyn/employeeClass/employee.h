//
//  employee.h
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface employee : NSObject{
    
    int         employeeID ;
    NSString*   name ;
    NSString*   dept ;

    NSString*   loginID ;
}

-(id) initWithEmployeeID : (int) empID ;

+(BOOL) newEmployee: (int) empID 
              name : (NSString*) _name
              dept : (NSString*) _dept ;

-(BOOL) saveEmployee ;

-(BOOL) deleteEmployee ;

-(NSString*) getLoginID ;


@end
