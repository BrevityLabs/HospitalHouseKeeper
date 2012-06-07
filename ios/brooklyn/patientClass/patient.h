//
//  patient.h
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "DBConnection.h"

@interface Patient : NSObject {

    NSString*       patientId; 
    NSString*       name;
    NSString*       address;
    NSString*       cell;
    NSString*       bedNo; //comes from the link table BedPatient
}

@property (nonatomic,retain) NSString* patientId; 
@property (nonatomic,retain) NSString* name;
@property (nonatomic,retain) NSString* address; 
@property (nonatomic,retain) NSString* cell;
@property (nonatomic,retain) NSString* bedNo;


+(NSMutableArray*) getPatientList ;

-(id) initWithPatientId: (NSString*) _patientId ;

-(NSString*) getAllocatedBedNo: (NSString*) _bedId ;


@end
