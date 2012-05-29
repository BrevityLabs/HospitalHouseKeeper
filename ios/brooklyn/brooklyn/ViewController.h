//
//  ViewController.h
//  brooklyn
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaintStaffLogin.h"

@interface ViewController : UIViewController
{
    UIButton *nurseStaffButton,*maintStaffButton,*staticButton;
}
@property(nonatomic,strong)IBOutlet UIButton *nurseStaffButton,*maintStaffButton,*staticButton;

-(IBAction)maintStaffButton:(id)sender;

@end
