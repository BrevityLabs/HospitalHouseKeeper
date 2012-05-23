//
//  BedStatusView.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 22/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BedStatusView : UIViewController
{
    UIButton *gridViewButton,*listViewButton;
    
    UIView *maintBedView;
    
    
    NSMutableArray *bedNoArray;
    
    enum img_size {
        XOFFSET = 30,
        YOFFSET = 30,
        IMGWIDTH =200,
        IMGHEIGHT= 136
    };
    enum label_size {
        LABEL_X = 0,
        LABEL_Y = 0,
        LABEL_WIDTH =50,
        LABEL_HEIGHT= 50
    };
    
    
}

@property(nonatomic,retain)IBOutlet UIView *maintBedView;

@property(nonatomic,retain)IBOutlet UIButton *gridViewButton,*listViewButton;



-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
                   bedId : (NSString*) _bedId ;


//-(IBAction)gridView:(id)sender;

//-(IBAction)listView:(id)sender;

-(void)getMaintBedNumber;

-(NSString *)getDBPath1;

@end
