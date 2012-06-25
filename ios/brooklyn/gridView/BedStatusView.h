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
    UIButton*   gridViewButton;
    UIButton*   listViewButton;
    UIButton*   signOutButton;
    UIButton*   numberbutton;
    UIButton*   actionButton;
    UIButton*   imgButton;
    UIView*     maintBedView;
    UILabel*    label;
    
    
    NSInteger bednumber;  //these may be unnecessary - :MB
    NSString* number; //these may be unnecessary - :MB
    NSMutableArray* bedNoArray;//these may be unnecessary - :MB
    NSMutableArray* bedIdArray;
    NSMutableArray* tagArray;
    
    enum imageButton_size {
        IMGBTNXOFFSET = 30,
        IMGBTNYOFFSET = 30,
        IMGBTNWIDTH =175,
        IMGBTNHEIGHT= 136
    };
    enum numberButton_size {
        NUMBUTTON_X = 0,
        NUMBUTTON_Y = 0,
        NUMBUTTON_WIDTH =50,
        NUMBUTTON_HEIGHT= 50
    };
    enum actionButton_size {
        STATBUTTON_X = 0,
        STATBUTTON_Y = 150,
        STATBUTTON_WIDTH =120,
        STATBUTTON_HEIGHT= 40
        
    };
    
    enum bed_cell_dim {
        WIDTH  = 200,
        HEIGHT = 190,
        OFFSETX = 12,
        OFFSETY = 200
    };
    enum imageView_dim {
        IMG_X = 0,
        IMG_Y = 0,
        IMG_WIDTH  = 1024,
        IMG_HEIGHT = 110,

    };
    enum label1_dim {
        LAB1_X = 0,
        LAB1_Y = 110,
        LAB1_WIDTH  = 400,
        LAB1_HEIGHT = 34,
        
    };
    enum label2_dim {
        LAB2_X =400,
        LAB2_Y = 110,
        LAB2_WIDTH  = 624,
        LAB2_HEIGHT = 34,
        
    };

    enum listButton_dim {
        LISTBTN_X =770,
        LISTBTN_Y = 110,
        LISTBTN_WIDTH  =25,
        LISTBTN_HEIGHT = 34,
        
    };
    enum gridButton_dim {
        GRIDBTN_X =810,
        GRIDBTN_Y = 110,
        GRIDBTN_WIDTH  =25,
        GRIDBTN_HEIGHT = 34,
        
    };
    enum signoutButton_dim {
        SIGNOUTBTN_X =900,
        SIGNOUTBTN_Y = 117,
        SIGNOUTBTN_WIDTH  =66,
        SIGNOUTBTN_HEIGHT = 22,
        
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
@property(nonatomic,readwrite)NSInteger bednumber;
@property(nonatomic,retain)NSString* number;
@property(nonatomic,retain)NSString* status;
@property(nonatomic,retain)NSString* bedID;

-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
               bedNumber : (NSString*) _bedNumber; //for displaying the gridview of beds to be cleaned.

-(IBAction)gridView:(id)sender;
-(IBAction)listView:(id)sender;
-(IBAction)maintStaffDetilView:(UIButton *)sender;
-(IBAction)signOut:(id)sender;
-(IBAction)cleaningDone:(UIButton *)sender;
-(IBAction)imageDetailView:(UIButton *)sender;
-(void)getGridView: (int) num_column;
-(void)goDetailView;
-(void)showHeader;
@end
