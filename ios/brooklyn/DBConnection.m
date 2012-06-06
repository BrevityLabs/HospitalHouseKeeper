//
//  DBConnection.m
//  brooklyn
//
//  Created by Mukul Biswas on 06/06/12.
//  Copyright (c) 2012 mukul@trendwiseanalytics.com. All rights reserved.
//

#import "DBConnection.h"

@implementation DBConnection

static sqlite3 * database = nil ;
static bool flag = false ;

-(id) init {
    
    if (self = [super init ]) {
//        NSString *dbpath = [self createDB];
//        
//        if( sqlite3_open([dbpath UTF8String], &database) == SQLITE_OK){
//            
//        }

    }
}

+(NSString *)createDB {
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    
    NSString *documentsdir=[paths objectAtIndex:0];
    NSString *dbpath=[documentsdir
                      stringByAppendingPathComponent:@"brookelyn.sqlite"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    NSError *error;
    
    BOOL success=[fileManager fileExistsAtPath:dbpath];
    
    if(!success)
    {
        NSString *defaultpath=[[[NSBundle
                                 mainBundle]resourcePath]stringByAppendingPathComponent:@"brookelyn.sqlite"];
        
        success=[fileManager copyItemAtPath:defaultpath toPath:dbpath
                                      error:&error];
        
        if(!success)
            NSAssert1(0,@"failed to create writable database.'%@'",
                      [error localizedDescription]);
        
    }
    NSLog(@"%@",dbpath);
    return dbpath;
}

+(sqlite3*) connectionFactory {
    
    if (!flag) {
        NSString *dbpath = [self createDB];
        if( sqlite3_open([dbpath UTF8String], &database) == SQLITE_OK){
            NSLog(@"Class DBConnection:connectionFactory:: DB Connect successful") ;
            flag = true ;
        } else {
            NSLog(@"Class DBConnection:connectionFactory::DB Connect failed");
        }
    }
    return database ;
}

@end
