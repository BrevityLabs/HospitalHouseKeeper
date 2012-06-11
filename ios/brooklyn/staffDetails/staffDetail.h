//
//  staffDetail.h
//  brooklyn
//
//  Created by Maya on 04/06/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

#import "DBConnection.h"

@interface staffDetail : NSObject
{
    NSString* Bedno;
    NSString* Empname;
    NSString* StatusTime;
}

@property(nonatomic,retain)NSString* Bedno;
@property(nonatomic,retain)NSString* Empname;
@property(nonatomic,retain)NSString* StatusTime;
+(NSMutableArray *)getAllData;

@end
