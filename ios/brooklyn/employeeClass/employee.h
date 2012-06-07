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
    NSString*   post;
}
@property (nonatomic,retain) NSString* employeeID ; 
@property (nonatomic,retain) NSString* name;
@property (nonatomic,retain) NSString* dept;
@property (nonatomic,retain) NSString* loginID;
@property (nonatomic,retain) NSString*   post;

-(id) initWithEmployeeID : (NSString*) empID ;

+(BOOL) newEmployee: (NSString*)_empID 
              name : (NSString*) _name
              dept : (NSString*) _dept ;

-(BOOL) saveEmployee ;

-(BOOL) deleteEmployee ;

-(NSString*) getLoginID ;

+(NSMutableArray*) getEmployeeList ; // static method to get employee object list

-(NSString*) getEmployeeID: (NSString*) _employeeId;

@end
