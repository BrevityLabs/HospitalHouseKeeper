//
//  ViewController.h
//  brooklyn
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MaintStaffLogin.h"
#import "DBConnection.h"

@interface ViewController : UIViewController
{
    UIButton *maintStaffButton;
    
    DBConnection * dbconn ;
}

@property(nonatomic,strong)IBOutlet UIButton *maintStaffButton;

-(void) initializeDBConnection ;

-(IBAction)maintStaffButton:(id)sender;

@end
