//
//  BedStatusView.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <sqlite3.h>

#import "MaintStaffDetailView.h"

#import "MaintStaffLogin.h"

#import "BedListView.h"

#import "bed.h"

@interface BedStatusView : UIViewController
{
    UIButton *gridViewButton,*listViewButton,*signOutButton;
    
    UIView *maintBedView;
    
    
    NSMutableArray *bedNoArray;
    
    enum img_size {
        XOFFSET = 30,
        YOFFSET = 30,
        IMGWIDTH =200,
        IMGHEIGHT= 136
    };
    enum button_size {
        BUTTON_X = 0,
        BUTTON_Y = 0,
        BUTTON_WIDTH =50,
        BUTTON_HEIGHT= 50
    };
    
    
}

@property(nonatomic,retain)IBOutlet UIView *maintBedView;

@property(nonatomic,retain)IBOutlet UIButton *gridViewButton,*listViewButton,*signOutButton;



-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
                   bedId : (NSString*) _bedId ;


//-(IBAction)gridView:(id)sender;

-(IBAction)listView:(id)sender;

-(IBAction)maintStaffDetilView:(id)sender;

-(IBAction)signOut:(id)sender;

-(void)clickSignOut;




@end
