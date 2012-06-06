//
//  ViewController.h
//  brooklyn
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MaintStaffLogin.h"
#import "NurseStaffLogin.h"
#import "DBConnection.h"

@interface ViewController : UIViewController
{
    UIButton *nurseStaffButton,*maintStaffButton,*staticButton;
    
    DBConnection * dbconn ;
}

@property(nonatomic,strong)IBOutlet UIButton *nurseStaffButton,*maintStaffButton,*staticButton;

-(void) initializeDBConnection ;

-(IBAction)maintStaffButton:(id)sender;

-(IBAction)nurseStaffButton:(id)sender;
@end
