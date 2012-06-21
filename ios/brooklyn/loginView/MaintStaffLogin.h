//
//  MaintStaffLogin.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BedStatusView.h"

#import "Employee.h"

#import <sqlite3.h>

@interface MaintStaffLogin : UIViewController 
{
    UITextField*    userName;
    UITextField*    password;
    UIButton*       loginButton;
    NSMutableArray* passwordArray;
    NSMutableArray* usernameArray;
    int roleFlag;    //flag maintained to check the role - nurse, doctor or cleaning staff 
    Employee *list;
}

@property(nonatomic,retain)IBOutlet UITextField* userName;
@property(nonatomic,retain)IBOutlet UITextField* password;
@property(nonatomic,retain)IBOutlet UIButton *loginButton;

-(IBAction)loginClicked:(id)sender;
@end
