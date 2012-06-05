//
//  BedVar.h
//  brooklyn
//
//  Created by Maya on 05/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BedVar : NSObject
{
    NSString *bedNumber;
     NSString *bedStatus;
}
@property(nonatomic,retain)NSString *bedNumber,*bedStatus;
@end
