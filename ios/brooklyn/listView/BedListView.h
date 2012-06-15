//
//  BedListView.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Bed.h"

#import "BedStatusView.h"

#import "MaintStaffLogin.h"

#import "MaintStaffDetailView.h"


#define ROW_HEIGHT 44
#define CELL_WIDTH 850
#define LABEL_HEIGHT 44

//Lets define the dimensions of the two columns
//Set the column offset and the width.
#define BEDID_OFFSET 112.0
#define BEDID_WIDTH 58.0
#define BEDID_TAG 1

#define BEDNO_OFFSET 172.0
#define BEDNO_WIDTH 74.0
#define BEDNO_TAG 2

#define PATIENT_OFFSET 60.0
#define PATIENT_WIDTH 270.0
#define PATIENT_TAG 3

#define ACTION_OFFSET 422.0
#define ACTION_WIDTH 170.0
#define ACTION_TAG 4

#define BEDTYPE_OFFSET 594.0
#define BEDTYPE_WIDTH 99.0
#define BEDTYPE_TAG 5

#define COLOR_OFFSET 696.0
#define COLOR_WIDTH 62.0
#define COLOR_TAG 6

#define STATUS_OFFSET 751.0
#define STATUS_WIDTH 165.0
#define STATUS_TAG 7

@interface BedListView : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *listView;    
    
    NSMutableArray *Array;
    Bed* list ;
}

@property(nonatomic,retain)IBOutlet UITableView *listView;


-(IBAction)getGridView:(id)sender;


-(IBAction)signOut:(id)sender;

-(UITableViewCell *)reuseTableViewCellWithIdentifier:(NSString *)identifier;
@end
