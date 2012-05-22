//
//  ViewController.h
//  HospitalBedManagement
//
//  Created by Maya on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIButton *button1;
}
@property(nonatomic,strong)IBOutlet UIButton *button1;
-(IBAction)click:(id)sender;
@end
