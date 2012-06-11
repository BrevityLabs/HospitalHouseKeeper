//
//  MaintList.h
//  brooklyn
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DBConnection.h"

#import <sqlite3.h>

@interface MaintList : NSObject
{
    NSString* Empid;
    NSString* Bedno;
    NSString* Empname;
    
}
@property(nonatomic,retain)NSString* Empid;
@property(nonatomic,retain)NSString* Bedno;
@property(nonatomic,retain)NSString* Empname;

+(NSMutableArray *)getAllData;
@end
