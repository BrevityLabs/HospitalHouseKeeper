//
//  BedView.h
//  brooklyn
//
//  Created by Maya on 04/06/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Bed.h"

#import "PatientDetailView.h"

#import <QuartzCore/QuartzCore.h>
@interface BedView : UIViewController
{
    UIButton* nurGridViewButton;
    UIButton* nurListViewButton;
  //  UIButton* *signOutButton;
    UIView* nurseBedView;
    UIButton* bedImgButton;
    UIButton* bedNoButton;
    NSString* status;
    NSString* bednumber;
    NSString* type;
    NSMutableArray* bedArray;
    
    enum bedImgButton_size {
        BEDIMGXOFFSET = 30,
        BEDIMGYOFFSET = 30,
        BEDIMGWIDTH =175,
        BEDIMGHEIGHT= 120
    };
    enum bedButton_size {
        BEDNOBUTTON_X = 0,
        BEDNOBUTTON_Y = 0,
        BEDNOBUTTON_WIDTH =50,
        BEDNOBUTTON_HEIGHT= 50
    };
    
    
}

@property(nonatomic,retain)IBOutlet UIView* nurseBedView;
@property(nonatomic,retain)IBOutlet UIButton* bedImgButton;
@property(nonatomic,retain)IBOutlet UIButton* bedNoButton;

@property(nonatomic,retain)IBOutlet UIButton* nurGridViewButton;
@property(nonatomic,retain)IBOutlet UIButton* nurListViewButton;
//@property(nonatomic,retain)IBOutlet UIButton* signOutButton;
@property(nonatomic,retain) NSString* bednumber;
@property(nonatomic,retain) NSString* status;
@property(nonatomic,retain) NSString* type;

-(IBAction)patientDetailview:(id)sender;

-(IBAction)messageView:(id)sender;

-(void) drawnurBedAvailable : (float) x_pos 
                   y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
                bedNumber: (NSString*) _bedId ; // for displaying the gridview of sbeds in the database.


@end
