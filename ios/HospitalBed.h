//
//  HospitalBed.h
//  HospitalBedManagement
//
//  Created by Maya on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HospitalBed : UIViewController
{
    UIView *bedView;
    UIButton *nextButton;
    
    enum img_size {
        XOFFSET = 50,
        YOFFSET = 50,
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
@property(nonatomic,retain)IBOutlet UIView *bedView;
@property(nonatomic,retain)IBOutlet UIButton *nextButton;

-(void) drawBedAvailable : (float) x_pos 
                       y : (float) y_pos  
                   width : (float) _width 
                  height : (float) _height 
                   bedId : (NSString*) _bedId ;


-(void)changeStatus:(int)_status;

-(IBAction)next:(id)sender;

@end
