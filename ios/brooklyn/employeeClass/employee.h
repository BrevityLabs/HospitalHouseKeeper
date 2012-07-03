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
#import "Bed.h"
@interface Employee : NSObject{
    
    NSString*   employeeID ;
    NSString*   name ;
    NSString*   dept ;
    NSString*   loginID ;
    NSString*   password ;
    NSString*   role;
    NSString*   bedNo;
    NSString*   statusTime;
   
}
@property (nonatomic,retain) NSString* employeeID ; 
@property (nonatomic,retain) NSString* name;
@property (nonatomic,retain) NSString* dept;
@property (nonatomic,retain) NSString* loginID;
@property (nonatomic,retain) NSString* role; 
@property (nonatomic,retain) NSString* bedNo;
@property (nonatomic,retain) NSString* statusTime;
@property (nonatomic,retain) NSString* password ;

-(id) initWithEmployeeID : (NSString*) empID ;

-(id) initWithLoginID : (NSString*) _loginID;

+(BOOL) newEmployee: (NSString*) _empID 
              name : (NSString*) _name
              dept : (NSString*) _dept ;

-(BOOL) saveEmployee ;

-(BOOL) deleteEmployee ;

+(NSMutableArray*) getLoginID;

+(NSMutableArray*) getEmployeeList ;

-(NSString*) getEmployeeID: (NSString*) _employeeId;

+(NSMutableArray *) getBedBeingCleaned:(NSString* )_bedNo;

@end
