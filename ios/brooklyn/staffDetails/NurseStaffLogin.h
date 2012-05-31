//
//  NurseStaffLogin.h
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <sqlite3.h>

#import "PatientBedView.h"

@interface NurseStaffLogin : UIViewController <UITextFieldDelegate>
{
    UITextField *txtNurUserName,*txtNurPassword;
    
    UIButton *loginNurButton;
    
    NSMutableArray *passwordArray;
    
    NSMutableArray *usernameArray;
      int flg;
}

@property(nonatomic,retain)IBOutlet UITextField *txtNurUserName,*txtNurPassword;

@property(nonatomic,retain)IBOutlet UIButton *loginNurButton;

-(IBAction)loginClicked:(id)sender;

-(BOOL)clickLogin;

//-(void)goNextView;

-(NSString *)getDBPath;


@end
