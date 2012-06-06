//
//  DBConnection.h
//  brooklyn
//
//  Created by Mukul Biswas on 06/06/12.
//  Copyright (c) 2012 mukul@trendwiseanalytics.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBConnection : NSObject {
//    sqlite3 * database ;
//    DBConnection * conn ;
}

+(sqlite3*) connectionFactory ;
+(NSString *) createDB ;

@end
