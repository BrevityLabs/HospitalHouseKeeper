//
//  MaintStaffLogin.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BedStatusView.h"

#import <sqlite3.h>

@interface MaintStaffLogin : UIViewController <UITextFieldDelegate>
{
    UITextField *txtUserName,*txtPassword;
    
    UIButton *loginButton;
}

@property(nonatomic,retain)IBOutlet UITextField *txtUserName,*txtPassword;

@property(nonatomic,retain)IBOutlet UIButton *loginButton;

-(IBAction)loginClicked:(id)sender;

-(void)clickLogin;

-(void)goNextView;

-(NSString *)getDBPath;

//-(void)passwordValidation;
@end
