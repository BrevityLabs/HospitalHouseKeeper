//
//  MaintStaffDetailView.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 24/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Employee.h"

#import "BedStatusView.h"
@interface MaintStaffDetailView : UIViewController
{
    UITextField* txt_BedNo;
    UITextField* txt_BedAssign;
    UITextField* txt_WorkStatus;
    UITextField* txt_Pedding;
    
    UIButton* backButton;
    UIButton* cleaningDoneButton;
    
    NSMutableArray *staffArray;
    NSMutableArray *staffID;
    NSString *bedNoValue;
}

@property(nonatomic,retain)IBOutlet UITextField* txt_BedNo;
@property(nonatomic,retain)IBOutlet UITextField* txt_BedAssign;
@property(nonatomic,retain)IBOutlet UITextField* txt_WorkStatus;
@property(nonatomic,retain)IBOutlet UITextField* txt_Pedding;
@property(nonatomic,retain)IBOutlet UIButton* backButton;
@property(nonatomic,retain)IBOutlet UIButton* cleaningDoneButton;
@property(nonatomic,retain) NSString* bedNoValue;
-(IBAction)Back:(id)sender;

-(IBAction)cleaningDone:(id)sender;
-(void)BackClicked;
-(void)getbedtitle:(NSString *)bednumber;
@end
