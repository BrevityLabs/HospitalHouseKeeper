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

@interface BedView : UIViewController
{
    UIButton *nurGridViewButton,*nurListViewButton;//*signOutButton;
    
    UIView *nurseBedView;
    UIImageView *img;
    UIButton *button;
//    UILabel *label;
    
    NSMutableArray *nurBedNoArray;
    
    enum bedImg_size {
        BIMGXOFFSET = 30,
        BIMGYOFFSET = 30,
        BIMGIMGWIDTH =200,
        BIMGIMGHEIGHT= 136
    };
    enum bedButton_size {
        BEDBUTTON_X = 0,
        BEDBUTTON_Y = 0,
        BEDBUTTON_WIDTH =50,
        BEDBUTTON_HEIGHT= 50
    };
    
    
}

@property(nonatomic,retain)IBOutlet UIView *nurseBedView;

@property(nonatomic,retain)IBOutlet UIImageView *img;
//
@property(nonatomic,retain)IBOutlet UIButton *button ;

@property(nonatomic,retain)IBOutlet UIButton *nurListViewButton,*nurGridViewButton;//*signOutButton;

-(IBAction)patientDetailview:(id)sender;

-(void) drawnurBedAvailable : (float) x_pos 
                   y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
                bedId : (NSString*) _bedId ;


@end
