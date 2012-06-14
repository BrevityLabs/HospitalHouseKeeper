//
//  BedStatusView.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

#import <sqlite3.h>

#import "MaintStaffDetailView.h"

#import "MaintStaffLogin.h"

#import "BedListView.h"

#import "bed.h"

@interface BedStatusView : UIViewController <UIAlertViewDelegate>
{
    UIButton* gridViewButton;
    UIButton* listViewButton;
    UIButton* signOutButton;
    UIButton* numberbutton;
    UIButton *actionButton;
    UIButton *imgButton;
    UIView* maintBedView;
    UILabel *label;
    
    NSString* bedID;
    NSString* bednumber;
     NSString* number;
    NSString* status;
    NSMutableArray* bedNoArray;
     NSMutableArray* beds;
    enum imgButton_size {
        IMGBTNXOFFSET = 30,
        IMGBTNYOFFSET = 30,
        IMGBTNWIDTH =200,
        IMGBTNHEIGHT= 136
    };
    enum button_size {
        NUMBUTTON_X = 0,
        NUMBUTTON_Y = 0,
        NUMBUTTON_WIDTH =50,
        NUMBUTTON_HEIGHT= 50
    };
    enum statusButton_size {
        STATBUTTON_X = 0,
        STATBUTTON_Y = 150,
        STATBUTTON_WIDTH =120,
        STATBUTTON_HEIGHT= 25
        
    };
    
    
}

@property(nonatomic,retain)IBOutlet UIView* maintBedView;
@property(nonatomic,retain)IBOutlet UIButton* gridViewButton;
@property(nonatomic,retain)IBOutlet UIButton* listViewButton;
@property(nonatomic,retain)IBOutlet UIButton* signOutButton;
@property(nonatomic,retain)IBOutlet UIButton* numberbutton;
@property(nonatomic,retain)IBOutlet UIButton* actionButton;
@property(nonatomic,retain)IBOutlet UIButton *imgButton;
@property(nonatomic,retain)IBOutlet UILabel *label;
@property(nonatomic,retain)NSString* bednumber;
@property(nonatomic,retain)NSString* number;
@property(nonatomic,retain)NSString* status;
@property(nonatomic,retain)NSString* bedID;

-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
               bedNumber : (NSString*) _bedNumber ;


//-(IBAction)gridView:(id)sender;

-(IBAction)listView:(id)sender;

-(IBAction)maintStaffDetilView:(UIButton *)sender;

-(IBAction)signOut:(id)sender;

-(void)clickSignOut;

-(IBAction)cleaningDone:(id)sender;
-(IBAction)imageDetailView:(UIButton *)sender;

-(void)getGridView;
-(void)goDetailView;
@end
