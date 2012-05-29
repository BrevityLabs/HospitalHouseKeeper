//
//  BedListView.h
//  HospitalBedManagementSystem
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 Trendwise Analytics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BedListView : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tableView;    
    
    NSMutableArray *BedNoArray;
    
    NSMutableArray *CleanerName;
    
    NSMutableArray *BedTypeArray;
    
    NSMutableArray *CleanStsArray;
    
    NSMutableArray *IDArray;
    
}

@property(nonatomic,retain)IBOutlet UITableView *tableView;

@property (nonatomic, retain)NSMutableArray *BedNoArray;

@property (nonatomic, retain)NSMutableArray *CleanerName;

@property (nonatomic, retain)NSMutableArray *BedTypeArray;

@property (nonatomic, retain)NSMutableArray *CleanStsArray;

@property (nonatomic, retain) NSMutableArray *IDArray;


-(NSString *)getDBPath;

-(UITableViewCell *)reuseTableViewCellWithIdentifier:(NSString *)identifier;

@end
