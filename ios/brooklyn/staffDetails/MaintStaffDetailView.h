//
//  MaintStaffDetailView.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 24/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Employee.h"

@interface MaintStaffDetailView : UIViewController
{
    UITextField  *txt_BedNo,*txt_BedAssign,*txt_WorkStatus,*txt_Pedding;
    
    UIButton *backButton,*cleaningDoneButton;
    
    NSMutableArray *staffArray;
}

@property(nonatomic,retain)IBOutlet UITextField  *txt_BedNo,*txt_BedAssign,*txt_WorkStatus,*txt_Pedding;

@property(nonatomic,retain)IBOutlet UIButton *backButton,*cleaningDoneButton;

-(IBAction)Back:(id)sender;

-(void)BackClicked;
@end
