//
//  MaintenanceView.h
//  brooklyn
//
//  Created by Maya on 06/06/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaintenanceView : UIViewController
{
    UILabel *messageLabel;
    UIButton *backButton;
}
@property(nonatomic,retain)IBOutlet UILabel *messageLabel;

@property(nonatomic,retain)IBOutlet UIButton *backButton;
@end
