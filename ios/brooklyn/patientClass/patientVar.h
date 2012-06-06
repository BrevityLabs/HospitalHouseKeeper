//
//  patientVar.h
//  brooklyn
//
//  Created by Maya on 06/06/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface patientVar : NSObject
{
    NSString *patId,*patName,*patAddrs,*patBedNo;
}
@property(nonatomic,retain)NSString *patId,*patName,*patAddrs,*patBedNo;
@end
