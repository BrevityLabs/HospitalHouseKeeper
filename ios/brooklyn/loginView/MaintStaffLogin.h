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
    UITextField *txtUserName,*txtPassword;
    
    NSMutableArray *passwordArray;
    UIButton *loginButton;
    NSMutableArray *usernameArray;
    int flg;
}

@property(nonatomic,retain)IBOutlet UITextField *txtUserName,*txtPassword;

@property(nonatomic,retain)IBOutlet UIButton *loginButton;

-(IBAction)loginClicked:(id)sender;


@end
