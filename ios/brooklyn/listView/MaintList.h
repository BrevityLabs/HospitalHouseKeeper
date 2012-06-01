//
//  MaintList.h
//  brooklyn
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MaintDB.h"

#import <sqlite3.h>

@interface MaintList : NSObject
{
    
}

+(NSString *)createDB;


+(NSMutableArray *)getAllData;
@end
