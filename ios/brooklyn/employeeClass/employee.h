//
//  employee.h
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

#import "DBConnection.h"
@interface Employee : NSObject{
    
    NSString*   employeeID ;
    NSString*   name ;
    NSString*   dept ;
    NSString*   loginID ;
    NSString*   role;
    NSString*   bedNo;
   
}
@property (nonatomic,retain) NSString* employeeID ; 
@property (nonatomic,retain) NSString* name;
@property (nonatomic,retain) NSString* dept;
@property (nonatomic,retain) NSString* loginID;
@property (nonatomic,retain) NSString* role; //change this to role
@property (nonatomic,retain) NSString* bedNo; // change this to bedNo
// get a property which an array of object of type Bed or just a number

-(id) initWithEmployeeID : (NSString*) empID ;

+(BOOL) newEmployee: (NSString*)_empID 
              name : (NSString*) _name
              dept : (NSString*) _dept ;

-(BOOL) saveEmployee ;

-(BOOL) deleteEmployee ;

-(NSString*) getLoginID :(NSString*) _loginid ;

+(NSMutableArray*) getEmployeeList ; // static method to get employee object list

-(NSString*) getEmployeeID: (NSString*) _employeeId;

+(NSMutableArray *) getBedBeingCleaned:(NSString* )_bedNo;//static method to get maintenance satff details
//  Change the name of the method to more meaningful name. Or get rid of it.
//  getBedBeingCleaned - it should be a non-static.


@end
