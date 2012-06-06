//
//  PatientDetailView.h
//  brooklyn
//
//  Created by Maya on 04/06/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "patientVar.h"
#import "patient.h"
@interface PatientDetailView : UIViewController
{
    UITextField *txt_PatientID,*txt_PatientName,*txt_PatAdmitted,*txt_PatientAddress,*txt_PatDoctorName,*txt_PatBedNo;
    
    UIButton *backButton,*dischargeButton,*saveButton;
    
    NSMutableArray *patientArray;
}
@property(nonatomic,retain)IBOutlet UITextField *txt_PatientID,*txt_PatientName,*txt_PatAdmitted,*txt_PatientAddress,*txt_PatDoctorName,*txt_PatBedNo;

@property(nonatomic,retain)IBOutlet UIButton *backButton,*dischargeButton,*saveButton;
@end
