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
    UIButton*  listViewButton;
     UIButton* signOutButton;
    
    UIView* maintBedView;
    
    NSString* bednumber;
    
    NSMutableArray *bedNoArray;
    
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

@property(nonatomic,retain)IBOutlet UIView *maintBedView;
@property(nonatomic,retain)IBOutlet UIButton *gridViewButton;
@property(nonatomic,retain)IBOutlet UIButton *listViewButton;
@property(nonatomic,retain)IBOutlet UIButton *signOutButton;
@property(nonatomic,retain)NSString* bednumber;


-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
                   bedId : (NSString*) _bedId ;


//-(IBAction)gridView:(id)sender;

-(IBAction)listView:(id)sender;

-(IBAction)maintStaffDetilView:(UIButton *)sender;

-(IBAction)signOut:(id)sender;

-(void)clickSignOut;

-(IBAction)cleaningDone:(id)sender;


@end
