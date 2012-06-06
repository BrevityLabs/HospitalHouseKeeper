//
//  patient.h
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

#import "patientVar.h"

@interface patient : NSObject
+(NSString *)createDB;

+(NSMutableArray *)getPatientData;


@end
