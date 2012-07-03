//
//  bed.h
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBConnection.h"
#import "Employee.h"
#import <sqlite3.h>

@interface Bed : NSObject {
    DBConnection* dbconn;

    NSString*   bedId;
    NSString*   number;
    NSString*   status;
    NSString*   type;
    NSString*   empId;
    NSString*   bedNo;
    NSInteger   bedstatus;
    
}

@property(nonatomic,retain) NSString* bedId;
@property(nonatomic,retain) NSString* number;
@property(nonatomic,retain) NSString* status;
@property(nonatomic,retain) NSString* type;
@property(nonatomic,retain) NSString* empId;
@property(nonatomic,retain) NSString* bedNo; 
@property(nonatomic,readonly)NSInteger bedstatus;


+(NSMutableArray *) getBedList ;        //gets the list of beds in the hospital

-(id) initWithBedId: (NSString*) _bedId ; 

+(NSMutableArray *) uncleanBeds;  

-(NSString* )getCleaningStaffName :(NSString*)_bedid ; 

-(NSString* )updateBedStatus:(NSString *)_bednumber; 

@end
