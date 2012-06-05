//
//  bed.h
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

#import "BedVar.h"
@interface bed : NSObject

+(NSString *)createDB;

+(NSMutableArray *)getAllData;

@end
