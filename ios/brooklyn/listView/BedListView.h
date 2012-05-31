//
//  BedListView.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MaintList.h"

#import "BedStatusView.h"

#import "MaintStaffLogin.h"

@interface BedListView : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *listView;    
    
    NSMutableArray *Array;
    
}

@property(nonatomic,retain)IBOutlet UITableView *listView;


-(IBAction)getGridView:(id)sender;


-(IBAction)signOut:(id)sender;
@end
