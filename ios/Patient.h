//
//  Patient.h
//  HospitalBedManagement
//
//  Created by Maya on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface Patient : UIViewController
{
    UIButton *savebutton,*cancelbutton;;
    UITextField *txt_Name,*txt_Address,*txt_CellNo,*txt_BedNo;
    
    UILabel *label_BedNo;
    
}

@property(nonatomic,retain)IBOutlet UIButton *savebutton,*cancelbutton;
@property(nonatomic,retain)IBOutlet UITextField *txt_Name,*txt_Address,*txt_CellNo,*txt_BedNo;
@property(nonatomic,retain)IBOutlet UILabel *label_BedNo;


-(IBAction)save:(id)sender;

//-(IBAction)cancel:(id)sender;

-(NSString *)getdbPath;

-(NSString *)getdbPath1;
-(void)allocateBed;

-(void)getBedNo;
-(void)SaveClicked;

-(void)updateBedStatus;
@end
