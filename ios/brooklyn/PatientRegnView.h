//
//  PatientRegnView.h
//  brooklyn
//
//  Created by Maya on 06/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientRegnView : UIViewController
{
    UITextField *reg_PatientID,*reg_PatientName,*reg_PatAdmitted,*reg_PatientAddress,*reg_PatDoctorName,*reg_PatBedNo;
    UIButton *regbackButton,*regdischargeButton,*reEnterButton;

}

@property(nonatomic,retain)IBOutlet UITextField *reg_PatientID,*reg_PatientName,*reg_PatAdmitted,*reg_PatientAddress,*reg_PatDoctorName,*reg_PatBedNo;

@property(nonatomic,retain)IBOutlet UIButton *regbackButton,*reEnterButton,*regsaveButton;
@end
