//
//  bed.h
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBConnection.h"

#import <sqlite3.h>

@interface bed : NSObject {
    DBConnection* dbconn ;
    NSString *bedNumber;
    NSString *bedStatus;
}
@property(nonatomic,retain)NSString *bedNumber,*bedStatus;

+(NSMutableArray *) getBedList ;
-(id) initWithBedId: (NSString*) _bedID ;

@end
