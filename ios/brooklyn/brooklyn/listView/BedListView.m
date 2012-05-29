//
//  BedListView.m
//  HospitalBedManagementSystem
//
//  Created by Maya on 29/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BedListView.h"

#import <sqlite3.h>

#define ROW_HEIGHT 50
#define CELL_WIDTH 320.0
#define LABEL_HEIGHT 20

#define NUMBER_OFFSET 45.0
#define NUMBER_WIDTH 64.0
#define NUMBER_TAG 1

#define BEDNOTEXT_OFFSET 45.0
#define BEDNOTEXT_WIDTH 92.0
#define BEDNOTEXT_TAG 2

#define NAMETEXT_OFFSET 45.0
#define NAMETEXT_WIDTH 215.0
#define NAMETEXT_TAG 3

#define BUTTONTEXT_OFFSET 35.0
#define BUTTONTEXT_WIDTH 158.0
#define BUTTONTEXT_TAG 4

#define BEDTYPETEXT_OFFSET 45.0
#define BEDTYPETEXT_WIDTH 97.0
#define BEDTYPETEXT_TAG 5

#define IMG_OFFSET 45.0
#define IMG_WIDTH 57.0
#define IMG_TAG 6

#define BEDSTATUSTEXT_OFFSET 45.0
#define BEDSTATUSTEXT_WIDTH 157.0
#define BEDSTATUSTEXT_TAG 7


static sqlite3 *database=nil;

static sqlite3_stmt *selectStmt =nil;

@implementation BedListView

@synthesize IDArray,BedNoArray,CleanerName,BedTypeArray,CleanStsArray;

@synthesize tableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    IDArray = [[NSMutableArray alloc]init];
    
    BedNoArray = [[NSMutableArray alloc]init];
    
    CleanerName = [[NSMutableArray alloc]init];
    
    BedTypeArray = [[NSMutableArray alloc]init];
    
    CleanStsArray = [[NSMutableArray alloc]init];
    
    NSString *dbpath = [self getDBPath];
    
    if (sqlite3_open([dbpath UTF8String], &database) == SQLITE_OK)
    {
        NSString *nsatt = [NSString stringWithFormat:@"Select * from BedStatus where Status = '2'"];
        
        const char *sql = [nsatt UTF8String];
        
        if (sqlite3_prepare_v2(database, sql, -1, &selectStmt, NULL)== SQLITE_OK) 
        {
            while (sqlite3_step(selectStmt) == SQLITE_ROW)
            {
                [IDArray addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 0)]];
                NSLog(@"%@",IDArray);
                
                [BedNoArray  addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 1)]];
                NSLog(@"%@",BedNoArray);
                
                [CleanerName addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 3)]];
                NSLog(@"%@",CleanerName);
                
                [BedTypeArray addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 4)]];
                NSLog(@"%@",BedTypeArray);
                
                [CleanStsArray addObject:[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStmt, 5)]];
                NSLog(@"%@",CleanStsArray);
                
            }
        }
        
        sqlite3_finalize(selectStmt);
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"My Cell";
    
    UITableViewCell *cell =[self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil)
        
        cell=[self reuseTableViewCellWithIdentifier:identifier];
    
    UILabel *labelText1 =(UILabel *)[cell viewWithTag:NUMBER_TAG];
    labelText1.text=[IDArray objectAtIndex:indexPath.row];
    
    UILabel *labelText2 =(UILabel *)[cell viewWithTag:BEDNOTEXT_TAG];
    labelText2.text=[BedNoArray objectAtIndex:indexPath.row];
    
    UILabel *labelText3 =(UILabel *)[cell viewWithTag:NAMETEXT_TAG];
    labelText3.text=[CleanerName objectAtIndex:indexPath.row];
    
    UIButton *button1 = (UIButton *)[cell viewWithTag:BUTTONTEXT_TAG];
    NSString *str4 =@"Cleaning Done";
    [button1 setTitle:str4 forState:UIControlStateNormal];
    
    UILabel *labelText4 =(UILabel *)[cell viewWithTag:BEDTYPETEXT_TAG];
    labelText4.text=[BedTypeArray objectAtIndex:indexPath.row];
    
    UIButton *button2 =(UIButton *)[cell viewWithTag:IMG_TAG];
    [button2 setBackgroundColor:[UIColor redColor]];
    
    UILabel *labelText5 =(UILabel *)[cell viewWithTag:BEDSTATUSTEXT_TAG];
    labelText5.text=[CleanStsArray objectAtIndex:indexPath.row];
    
    
    return cell;
    
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section    
{
    return [IDArray count];
}


-(UITableViewCell *)reuseTableViewCellWithIdentifier:(NSString *)identifier
{
    CGRect cellRectangle;
    
    cellRectangle = CGRectMake(91.0, 190.0,CELL_WIDTH, ROW_HEIGHT);
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]; 
    cell.frame =cellRectangle;
    
    CGRect cellRectangle1 = CGRectMake(91, 189, 64, 45);
    UILabel *label1;
    label1 = [[UILabel alloc]initWithFrame:cellRectangle1];
    label1.tag = NUMBER_TAG;
    [cell.contentView addSubview:label1];
    
    CGRect cellRectangle2 = CGRectMake(158, 190, 92, 45);
    UILabel *label2;
    label2 = [[UILabel alloc]initWithFrame:cellRectangle2];
    label2.tag = BEDNOTEXT_TAG;
    [cell.contentView addSubview:label2];
    
    CGRect cellRectangle3 = CGRectMake(252, 190, 215, 45);
    UILabel *label3;
    label3 = [[UILabel alloc]initWithFrame:cellRectangle3];
    label3.tag = NAMETEXT_TAG;
    [cell.contentView addSubview:label3];
    
    UIButton *button1;
    CGRect cellRectangle4 = CGRectMake(470, 190, 158, 35);
    button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame =cellRectangle4;
    button1.tag = BUTTONTEXT_TAG;
    [cell.contentView addSubview:button1];
    
    CGRect cellRectangle5 = CGRectMake(630, 190, 97, 45);
    UILabel *label4;
    label4 = [[UILabel alloc]initWithFrame:cellRectangle5];
    label4.tag = BEDTYPETEXT_TAG;
    [cell.contentView addSubview:label4];
    
    UIButton *button2;
    CGRect cellRectangle6 = CGRectMake(728, 190, 35, 45);
    button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame =cellRectangle6;
    button2.tag = IMG_TAG;
    [cell.contentView addSubview:button2];
    
    CGRect cellRectangle7 = CGRectMake(780, 190, 157, 45);
    UILabel *label5;
    label5 = [[UILabel alloc]initWithFrame:cellRectangle7];
    label5.tag =BEDSTATUSTEXT_TAG;
    [cell.contentView addSubview:label5];
    
    
    return cell;
}

-(NSString *)getDBPath
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,
                                                       YES);
    
    NSString *documentsdir=[paths objectAtIndex:0];
    NSString *dbpath=[documentsdir stringByAppendingPathComponent:@"BedInformation.sqlite"];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    NSError *error;
    
    BOOL success=[fileManager fileExistsAtPath:dbpath];
    
    if(!success)
    {
        NSString *defaultpath=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"BedInformation.sqlite"];
        
        success=[fileManager copyItemAtPath:defaultpath toPath:dbpath error:&error];
        
        if(!success)
            NSAssert1(0,@"failed to create writable database.'%@'",[error localizedDescription]);
        
    }
    NSLog(@"%@",dbpath);
    return dbpath;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
