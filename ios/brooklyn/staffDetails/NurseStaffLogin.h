//
//  NurseStaffLogin.h
//  brooklyn
//
//  Created by Maya on 30/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <sqlite3.h>

#import "BedView.h"

#import "Employee.h"

@interface NurseStaffLogin : UIViewController {
    UITextField *txtNurUserName;//,*txtNurPassword;
    
    NSMutableArray *nurPasswordArray;
    UIButton *loginNurButton;
    NSMutableArray *nurUsernameArray;
   // int flg;
}

@property(nonatomic,retain)IBOutlet UITextField *txtNurUserName;//,*txtNurPassword;

@property(nonatomic,retain)IBOutlet UIButton *loginNurButton;

-(IBAction)nurLoginClicked:(id)sender;






@end
