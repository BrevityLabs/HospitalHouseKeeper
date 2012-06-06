//
//  BedView.h
//  brooklyn
//
//  Created by Maya on 04/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "bed.h"

#import "PatientDetailView.h"

#import "PatientRegnView.h"

#import "MaintenanceView.h"
@interface BedView : UIViewController
{
    UIButton *nurGridViewButton,*nurListViewButton;//*signOutButton;
    
    UIView *nurseBedView;
    UIButton *bedImgButton;
    UIButton *bedNoButton;
    
    NSMutableArray *nurseBedNoArray;
    
    enum bedImgButton_size {
        BEDIMGXOFFSET = 30,
        BEDIMGYOFFSET = 30,
        BEDIMGWIDTH =200,
        BEDIMGHEIGHT= 136
    };
    enum bedButton_size {
        BEDNOBUTTON_X = 0,
        BEDNOBUTTON_Y = 0,
        BEDNOBUTTON_WIDTH =50,
        BEDNOBUTTON_HEIGHT= 50
    };
    
    
}

@property(nonatomic,retain)IBOutlet UIView *nurseBedView;

@property(nonatomic,retain)IBOutlet UIButton *bedImgButton;

@property(nonatomic,retain)IBOutlet UIButton *bedNoButton;

@property(nonatomic,retain)IBOutlet UIButton *nurListViewButton,*nurGridViewButton;//*signOutButton;

-(IBAction)patientDetailview:(id)sender;

-(IBAction)patientRegView:(id)sender;

-(IBAction)messageView:(id)sender;

-(void) drawnurBedAvailable : (float) x_pos 
                   y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
                bedId : (NSString*) _bedId ;


@end
